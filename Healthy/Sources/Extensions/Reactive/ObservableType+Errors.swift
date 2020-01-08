//
//  ObservableType+Errors.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxCocoa
import RxSwift

public extension ObservableType {

    /// Catches error and completes the sequence
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in return .empty() }
    }

    /// Asserts the observable sequence never emits error
    func catchErrorNever(file: StaticString = #file, line: UInt = #line) -> Observable<Element> {
        return catchError { error in
            assertionFailure("unexpected error in observable sequence: \(error)", file: file, line: line)
            return .empty()
        }
    }
}

public enum SharedSequenceErrorHandler {
    case never
}

public extension ObservableType {

    func asDriver(onError errorHandler: SharedSequenceErrorHandler, _ file: StaticString = #file, _ line: UInt = #line) -> Driver<Element> {
        return asDriver { error in
            switch errorHandler {
            case .never:
                assertionFailure("unexpected error in observable sequence: \(error)", file: file, line: line)
                return .empty()
            }
        }
    }

    func asSignal(onError errorHandler: SharedSequenceErrorHandler, _ file: StaticString = #file, _ line: UInt = #line) -> Signal<Element> {
        return asSignal { error in
            switch errorHandler {
            case .never:
                assertionFailure("unexpected error in observable sequence: \(error)", file: file, line: line)
                return .empty()
            }
        }
    }

    func retryWhen<O: ObservableConvertibleType>(_ eventSequence: O) -> Observable<Element> {
        return retryWhen { _ in eventSequence.asObservable() }
    }
}
