//
//  Routines.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import Foundation

@discardableResult
public func with<T>(_ object: T, do block: (T) -> Void) -> T {
    block(object)
    return object
}

@discardableResult
public func withRef<T>(_ valueRef: inout T, do block: (inout T) -> Void) -> T {
    block(&valueRef)
    return valueRef
}

public func withValue<T>(_ value: T, do block: (inout T) -> Void) -> T {
    var value = value
    block(&value)
    return value
}

public func doBlock<R>(_ block: () -> R) -> R {
    return block()
}

public func doBlock<T, R>(_ arg: T, _ block: (T) -> R) -> R {
    return block(arg)
}

func deferred<T>(file: StaticString = #file, line: UInt = #line) -> T {
    fatalError("value was not initialized", file: file, line: line)
}

public func abstractMethod(function: StaticString = #function, file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("method \(String(describing: function)) must be overridden", file: file, line: line)
}

// swiftlint:disable:next not_implemented
public func notImplemented(function: StaticString = #function, file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("function \(String(describing: function)) is not implemented yet", file: file, line: line)
}

public func assertMainThread(function: StaticString = #function, file: StaticString = #file, line: UInt = #line) {
    assert(Thread.isMainThread, "function \(String(describing: function)) must be used from the main thread", file: file, line: line)
}

public func runOnMainThread<T>(_ block: () throws -> T) rethrows -> T {
    if Thread.isMainThread {
        return try block()
    } else {
        return try DispatchQueue.main.sync(execute: block)
    }
}

// swiftlint:disable:next todo_localize
public func todoLocalize(_ string: String) -> String {
    return string
}

