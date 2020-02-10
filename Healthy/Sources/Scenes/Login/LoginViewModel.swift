//
//  LoginViewModel.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 04.02.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import RxCocoa
import RxSwift
import XCoordinator

final class LoginViewModel: ModuleViewModel {

    // MARK: - Dependencies
    let router: StrongRouter<LoginRoute>

    // MARK: - Public
    init(router: StrongRouter<LoginRoute>) {
        self.router = router
         
    }

    struct Input {
        let login: Signal<Void>
    }

    func setup(with input: LoginViewModel.Input) -> Disposable {
        input.login.asObservable()
            .subscribe { _ in
                self.router.trigger(.main)
        }
        .disposed(by: _bag)
        
        return Disposables.create([
            input.login
            .asObservable()
            .bind(to: _loginRelay)
        ])
    }

    // MARK: - Private
    let _bag = DisposeBag()
    var _loginRelay: PublishRelay<Void> = .init()
}
