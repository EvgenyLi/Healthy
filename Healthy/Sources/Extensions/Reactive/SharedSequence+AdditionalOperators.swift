//
//  SharedSequence+AdditionalOperators.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxCocoa
import RxSwift

public extension SharedSequence {

    func mapTo<R>(_ value: R) -> SharedSequence<SharingStrategy, R> {
        return map { _ in value }
    }

    func unwrapOptional<T>() -> SharedSequence<SharingStrategy, T> where Element == T? {
        return flatMap { .from(optional: $0) }
    }

    func unwrapOptional<T>(_ transform: @escaping (Element) -> T?) -> SharedSequence<SharingStrategy, T> {
        return flatMap { .from(optional: transform($0)) }
    }
}
