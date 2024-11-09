//
//  CacheTest.swift
//  PhotoViewer
//
//  Created by Anbalagan on 10/11/24.
//

import Testing
import Foundation
@testable import PhotoViewer

struct CacheTest {
    @Test
    func verifyCachedElement() {
        let cache = Cache(cost: 5)
        cache.store("1", forKey: "1")
        cache.store("2", forKey: "2")
        cache.store("3", forKey: "3")
        cache.store("4", forKey: "4")
        cache.store("5", forKey: "5")
        
        #expect(cache.get(forKey: "1") == "1")
        #expect(cache.get(forKey: "2") == "2")
        #expect(cache.get(forKey: "3") == "3")
        #expect(cache.get(forKey: "4") == "4")
        #expect(cache.get(forKey: "5") == "5")
    }
    
    @Test
    func savingCapacityOverflow() {
        let cache = Cache(cost: 5)
        cache.store("1", forKey: "1")
        cache.store("2", forKey: "2")
        cache.store("3", forKey: "3")
        cache.store("4", forKey: "4")
        cache.store("5", forKey: "5")
        cache.store("6", forKey: "6")
        
        #expect(cache.get(forKey: "1") == nil)
        #expect(cache.get(forKey: "2") == "2")
        #expect(cache.get(forKey: "3") == "3")
        #expect(cache.get(forKey: "4") == "4")
        #expect(cache.get(forKey: "5") == "5")
        #expect(cache.get(forKey: "6") == "6")
    }
    
    @Test
    func validateMostUsedElementPersistence() {
        let cache = Cache(cost: 5)
        cache.store("1", forKey: "1")
        cache.store("2", forKey: "2")
        cache.store("3", forKey: "3")
        cache.store("4", forKey: "4")
        cache.store("5", forKey: "5")
        
        cache.get(forKey: "3")
        
        cache.store("6", forKey: "6")
        cache.store("7", forKey: "7")
        cache.store("8", forKey: "8")
        cache.store("9", forKey: "9")
        
        cache.get(forKey: "3")
        
        cache.store("10", forKey: "10")
        
        #expect(cache.get(forKey: "3") == "3")
    }
}

extension Cache {
    func store(_ value: String, forKey key: String) {
        self.store(data: Data(value.utf8), forKey: key)
    }
    
    @discardableResult
    func get(forKey key: String) -> String? {
        if let data = self.retrive(key: key) {
            return String(decoding: data, as: UTF8.self)
        }
        return nil
    }
}
