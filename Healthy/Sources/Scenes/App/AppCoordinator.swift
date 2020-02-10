//
//  AppCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 04/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import XCoordinator

enum AppRoute: Route {
    case main
    case login
}

final class AppCoordinator: ViewCoordinator<AppRoute> {

    // MARK: - Public
    init() {
        super.init(rootViewController: .init(), initialRoute: nil)
        trigger(.login)
    }

    // MARK: - Overrides
    override func prepareTransition(for route: AppRoute) -> ViewTransition {

        switch route {
        case .main:
            let main = MainCoordinator()
            return .embed(main, in: rootViewController)
        case .login:
            let lc = LoginCoordinator()
            rootViewController.dismiss(animated: true, completion: nil)
            return .embed(lc, in: rootViewController)
        }
    }
}
