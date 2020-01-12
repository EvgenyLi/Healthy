//
//  Disposable+DisposedWith.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxSwift

public extension Disposable {

    @discardableResult
    func disposed(with compositeDisposable: CompositeDisposable) -> CompositeDisposable.DisposeKey? {
        return compositeDisposable.insert(self)
    }

    func disposed(with serialDisposable: SerialDisposable) {
        serialDisposable.disposable = self
    }
}

public extension Disposables {

    static func create(_ disposeBag: DisposeBag) -> Disposable {
        return BagDisposable(disposeBag)
    }

    static func create(_ disposable: Disposable) -> Disposable {
        return disposable
    }
}

private class BagDisposable: Disposable {

    init(_ disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
    }

    func dispose() {
        disposeBag = nil
    }

    private var disposeBag: DisposeBag?
}
