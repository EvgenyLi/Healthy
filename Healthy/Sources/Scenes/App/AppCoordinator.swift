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
}

final class AppCoordinator: ViewCoordinator<AppRoute> {
    
    // MARK: - Public
    init() {
        super.init(rootViewController: .init(), initialRoute: nil)
        trigger(.main)
    }
    
    // MARK: - Overrides
    override func prepareTransition(for route: AppRoute) -> ViewTransition {
        
        switch route {
        case .main:
            let main = MainCoordinator()
            return .embed(main, in: rootViewController)
        }
    }
}
