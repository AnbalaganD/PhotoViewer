//
//  NSLockExtension.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

extension NSLock {
    @inlinable func with<T>(_ action: () -> T) -> T {
        defer { unlock() }
        lock()
        return action()
    }
}
