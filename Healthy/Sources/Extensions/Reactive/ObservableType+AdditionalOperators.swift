//
//  ObservableType+AdditionalOperators.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxSwift

public extension ObservableType {

    func apply<T, R>(_ transform: (Observable<Element>) -> R) -> Observable<T> where R: ObservableConvertibleType, R.Element == T {
        return transform(asObservable()).asObservable()
    }

    func ignoreWhen<O: ObservableConvertibleType>(_ ignoreObservable: O) -> Observable<Element> where O.Element == Bool {
        return withLatestFrom(ignoreObservable) { (element: $0, ignore: $1) }
            .filter { !$0.ignore }
            .map { $0.element }
    }

    func mapTo<R>(_ value: R) -> Observable<R> {
        return map { _ in value }
    }

    func unwrapOptional<T>() -> Observable<T> where Element == T? {
        return flatMap { Observable.from(optional: $0) }
    }

    func unwrapOptional<T>(_ transform: @escaping (Element) throws -> T?) -> Observable<T> {
        return flatMap { Observable.from(optional: try transform($0)) }
    }
}
