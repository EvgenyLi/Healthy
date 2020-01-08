//
//  PillsListViewModel.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 05/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import RxCocoa
import RxSwift
import XCoordinator

final class PillsListViewModel: ModuleViewModel {

    // MARK: - Dependencies
    let router: UnownedRouter<PillsListRoute>

    // MARK: - Public
    init(router: UnownedRouter<PillsListRoute>) {
        self.router = router
    }

    struct Input {
        var buttonTapped: Signal<Void>
    }

    func setup(with input: PillsListViewModel.Input) -> Disposable {
        return Disposables.create([
            input.buttonTapped
                .asObservable()
                .bind(to: tapRelay)])
    }

    var output: Observable<String> {
        return tapRelay.mapTo("Test")
    }

    // MARK: - Private
    private let tapRelay = PublishRelay<Void>()
}
