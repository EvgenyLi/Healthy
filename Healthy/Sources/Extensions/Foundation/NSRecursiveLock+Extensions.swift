//
//  NSRecursiveLock+Extensions.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import Foundation

extension NSRecursiveLock {

    @discardableResult
    func performLocked<T>(action: () -> T) -> T {
        lock()
        defer {
            unlock()
        }
        return action()
    }
}
