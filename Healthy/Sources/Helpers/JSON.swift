//
//  JSON.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

public struct JSON {

    public typealias Array = [Any]
    public typealias Dictionary = [AnyHashable: Any]

    public func value<Value: JSONMappable>(ofType type: Value.Type = Value.self) throws -> Value {
        return try Value(from: self)
    }

    public func valueIfPresent<Value: JSONMappable>(ofType type: Value.Type = Value.self) throws -> Value? {
        do {
            return try value(ofType: type)
        } catch JSONError.keyNotFound {
            return nil
        } catch JSONError.indexOutOfRange {
            return nil
        }
    }

    public func value<Value: JSONMappable, U>(using transfromClosure: (Value) -> U?) throws -> U {
        let rawValue = try value(ofType: Value.self)
        guard let value = transfromClosure(rawValue) else {
            throw JSONError.invalidValue(type: U.self, value: rawValue, path: path, cause: nil)
        }
        return value
    }

    public func valueIfPresent<Value: JSONMappable, U>(using transfromClosure: (Value) -> U?) throws -> U? {
        guard let rawValue = try valueIfPresent(ofType: Value.self) else {
            return nil
        }
        guard let value = transfromClosure(rawValue) else {
            throw JSONError.invalidValue(type: U.self, value: rawValue, path: path, cause: nil)
        }
        return value
    }

    public func value<Value: JSONMappable, U>(using transfromClosure: (Value) throws -> U) throws -> U {
        let rawValue = try value(ofType: Value.self)
        do {
            return try transfromClosure(rawValue)
        } catch {
            throw JSONError.invalidValue(type: U.self, value: rawValue, path: path, cause: nil)
        }
    }

    public func valueIfPresent<Value: JSONMappable, U>(using transfromClosure: (Value) throws -> U) throws -> U? {
        guard let rawValue = try valueIfPresent(ofType: Value.self) else {
            return nil
        }
        do {
            return try transfromClosure(rawValue)
        } catch {
            throw JSONError.invalidValue(type: U.self, value: rawValue, path: path, cause: error)
        }
    }

    public func value<Value: RawRepresentable>(ofType type: Value.Type = Value.self) throws -> Value where Value.RawValue: JSONMappable {
        return try value(using: Value.init(rawValue:))
    }

    // swiftlint:disable:next line_length
    public func valueIfPresent<Value: RawRepresentable>(ofType type: Value.Type = Value.self) throws -> Value? where Value.RawValue: JSONMappable {
        do {
            return try value(using: Value.init(rawValue:))
        } catch JSONError.keyNotFound {
            return nil
        } catch JSONError.indexOutOfRange {
            return nil
        }
    }

    public subscript(_ index: Int) -> JSON {
        return JSON(path: .index(path, index))
    }

    public subscript(_ key: String) -> JSON {
        return JSON(path: .key(path, key))
    }

    public init(_ json: Dictionary) {
        path = .root(json)
    }

    public init(_ json: [String: Any]) {
        path = .root(json)
    }

    public init(_ json: Array) {
        path = .root(json)
    }

    fileprivate let path: JSONPath

    fileprivate init(path: JSONPath) {
        self.path = path
    }
}

public protocol JSONMappable {
    init(from json: JSON) throws
}

public enum JSONError: Error, CustomDebugStringConvertible {

    case keyNotFound(key: String, path: JSONPath)
    case indexOutOfRange(index: Int, path: JSONPath)
    case invalidValue(type: Any.Type, value: Any, path: JSONPath, cause: Error?)

    public var debugDescription: String {
        switch self {
        case let .keyNotFound(key, .root):
            return "key `\(key)` not found"
        case let .keyNotFound(key, path):
            return "key `\(key)` not found in `\(path)`"
        case let .indexOutOfRange(index, .root):
            return "index `\(index)` is out of range"
        case let .indexOutOfRange(index, path):
            return "index `\(index)` is out of range in `\(path)`"
        case let .invalidValue(type, _, .root, nil):
            return "can not parse value as type `\(type)`"
        case let .invalidValue(type, _, .root, cause?):
            return "can not parse value as type `\(type)` (cause: \(cause))"
        case let .invalidValue(type, _, path, nil):
            return "can not parse `\(path)` as type `\(type)`"
        case let .invalidValue(type, _, path, cause?):
            return "can not parse `\(path)` as type `\(type)` (cause: \(cause))"
        }
    }
}

public enum JSONPath: CustomStringConvertible {

    case root(Any)
    indirect case index(JSONPath, Int)
    indirect case key(JSONPath, String)

    public var description: String {
        switch self {
        case .root:
            return ""
        case let .index(path, index):
            return path.description.appending("[\(index)]")
        case let .key(.root, key):
            return key
        case let .key(path, key):
            return path.description.appending(".\(key)")
        }
    }

    fileprivate func value<T>(ofType type: T.Type = T.self) throws -> T {

        let rawValue: Any

        switch self {
        case let .root(value):
            rawValue = value
        case let .index(path, index):
            let array = try path.value(ofType: JSON.Array.self)
            guard array.indices.contains(index) else {
                throw JSONError.indexOutOfRange(index: index, path: path)
            }
            rawValue = array[index]
        case let .key(path, key):
            let dict = try path.value(ofType: JSON.Dictionary.self)
            guard let value = dict[key] else {
                throw JSONError.keyNotFound(key: key, path: path)
            }
            rawValue = value
        }

        guard let value = rawValue as? T else {
            throw JSONError.invalidValue(type: type, value: rawValue, path: self, cause: nil)
        }

        return value
    }
}

extension Int: JSONMappable {
    public init(from json: JSON) throws {
        self = try json.path.value()
    }
}

extension Int64: JSONMappable {
    public init(from json: JSON) throws {
        self = try json.path.value()
    }
}

extension Double: JSONMappable {
    public init(from json: JSON) throws {
        self = try json.path.value()
    }
}

extension String: JSONMappable {
    public init(from json: JSON) throws {
        self = try json.path.value()
    }
}

extension Bool: JSONMappable {
    public init(from json: JSON) throws {
        self = try json.path.value()
    }
}

extension Array: JSONMappable where Element == JSON.Array.Element {
    public init(from json: JSON) throws {
        self = try json.path.value()
    }
}

extension Dictionary: JSONMappable where Key == JSON.Dictionary.Key, Value == JSON.Dictionary.Value {
    public init(from json: JSON) throws {
        self = try json.path.value()
    }
}

extension JSON: JSONMappable {
    public init(from json: JSON) throws {
        self.init(path: .root(try json.path.value(ofType: Any.self)))
    }
}
