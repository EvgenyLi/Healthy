//
//  Optional+Unwrap.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

public extension Optional {

    struct UnwrapError: Error {

        let file: StaticString
        let line: UInt

        var localizedDescription: String {
            return "unable to unwrap nil value at line \(line) in \(String(describing: file))"
        }
    }

    func unwrap(file: StaticString = #file, line: UInt = #line) throws -> Wrapped {
        switch self {
        case let .some(value):
            return value
        case .none:
            throw UnwrapError(file: file, line: line)
        }
    }
}
