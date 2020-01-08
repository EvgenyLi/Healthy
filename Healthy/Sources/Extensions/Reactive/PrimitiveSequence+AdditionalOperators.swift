//
//  PrimitiveSequence+AdditionalOperators.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxSwift

// MARK: Completable

public extension PrimitiveSequence where Trait == CompletableTrait, Element == Swift.Never {

    func catchErrorJustComplete() -> Completable {
        return catchError { _ in
            return .empty()
        }
    }

    static func execute(_ action: @escaping () throws -> Void) -> Completable {
        return create { observer in
            do {
                try action()
                observer(.completed)
            } catch {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }

    func takeUntil<O: ObservableConvertibleType>(_ other: O) -> Completable {
        return asObservable().takeUntil(other.asObservable()).asCompletable()
    }
}

// MARK: - Maybe

public extension PrimitiveSequence where Trait == MaybeTrait {

    func asCompletable() -> Completable {
        return asObservable().ignoreElements()
    }

    func flatMap<R>(_ selector: @escaping (Element) throws -> Single<R>) -> Maybe<R> {
        return flatMap { try selector($0).asMaybe() }
    }

    func flatMapCompletable( _ selector: @escaping (Element) throws -> Completable) -> Completable {
        return asObservable()
            .flatMap { try selector($0).asObservable() }
            .asCompletable()
    }

    func unwrapOptional<T>() -> Maybe<T> where Element == T? {
        return asObservable().unwrapOptional().asMaybe()
    }

    func unwrapOptional<T>(_ transform: @escaping (Element) -> T?) -> Maybe<T> {
        return asObservable().unwrapOptional(transform).asMaybe()
    }
}

// MARK: - Single

public extension PrimitiveSequence where Trait == SingleTrait {

    static func combineLatest<T1, T2>(_ source1: Single<T1>,
                                      _ source2: Single<T2>,
                                      resultSelector: @escaping (T1, T2) throws -> Element) -> Single<Element> {

        return Observable.combineLatest(source1.asObservable(), source2.asObservable(), resultSelector: resultSelector).asSingle()
    }

    static func combineLatest<T1, T2>(_ source1: Single<T1>,
                                      _ source2: Single<T2>) -> Single<(T1, T2)> {

        return Observable.combineLatest(source1.asObservable(), source2.asObservable()).asSingle()
    }

    func unwrapOptional<T>() -> Maybe<T> where Element == T? {
        return asObservable().unwrapOptional().asMaybe()
    }

    func unwrapOptional<T>(_ transform: @escaping (Element) -> T?) -> Maybe<T> {
        return asObservable().unwrapOptional(transform).asMaybe()
    }
}
