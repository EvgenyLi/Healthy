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

final class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    // MARK: - Public
    init() {
        super.init(initialRoute: nil)
        trigger(.main)
    }
    
    // MARK: - Overrides
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        
        switch route {
        case .main:
            let main = MainCoordinator()
            return .push(main)
        }
    }
}
