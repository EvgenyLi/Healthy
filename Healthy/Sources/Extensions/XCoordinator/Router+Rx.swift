//
//  Router+Rx.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxSwift
import XCoordinator

extension Router {

    public var rx: Reactive<Self> {
        // swiftlint:disable:previous identifier_name
        return Reactive(self)
    }
}

extension Reactive where Base: Router {

    public func trigger(_ route: Base.RouteType) -> Completable {
        return Completable.create { [base] observer in
            base.trigger(route) {
                observer(.completed)
            }
            return Disposables.create()
        }
    }

    public func trigger(_ route: Base.RouteType, with options: TransitionOptions) -> Completable {
        return Completable.create { [base] observer in
            base.trigger(route, with: options) {
                observer(.completed)
            }
            return Disposables.create()
        }
    }
}
