//
//  DataExtension.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 03/07/24.
//

import Foundation
import Compression

extension Data {
    func compressed(
        using algorithm: Algorithm,
        pageSize: Int = 128
    ) throws -> Data {
        var outputData = Data()
        let filter = try OutputFilter(.compress, using: algorithm, bufferCapacity: pageSize) {
            $0.flatMap { outputData.append($0) }
        }
        
        var index = 0
        let bufferSize = count
        
        while true {
            let rangeLength = Swift.min(pageSize, bufferSize - index)
            
            let subdata = self.subdata(in: index ..< index + rangeLength)
            index += rangeLength
            
            try filter.write(subdata)
            
            if rangeLength == 0 { break }
        }
        
        return outputData
    }

    func decompressed(
        using algorithm: Algorithm,
        pageSize: Int = 128
    ) throws -> Data {
        var outputData = Data()
        let bufferSize = count
        var decompressionIndex = 0
        
        let filter = try InputFilter(.decompress, using: algorithm) { (length: Int) -> Data? in
            let rangeLength = Swift.min(length, bufferSize - decompressionIndex)
            let subdata = self.subdata(in: decompressionIndex ..< decompressionIndex + rangeLength)
            decompressionIndex += rangeLength
            return subdata
        }
        
        while let page = try filter.readData(ofLength: pageSize) {
            outputData.append(page)
        }
        
        return outputData
    }
}
