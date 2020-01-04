//
//  MainCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 03/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import XCoordinator

enum MainRoute: Route {
    case initial
}

final class MainCoordinator: BaseCoordinator<MainRoute, Transition<MainTabBarViewController>> {
    
    init() {
        super.init(rootViewController: MainTabBarViewController(), initialRoute: .initial)
    }
    
    override func prepareTransition(for route: MainRoute) -> Transition<MainTabBarViewController> {
        switch route {
        case .initial:
            return .select(index: 0)
        }
    }
}
