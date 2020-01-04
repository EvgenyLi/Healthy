//
//  PillsListCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 03/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import XCoordinator

enum PillsListRoute: Route {
    case initial
}

class PillsListCoordinator: NavigationCoordinator<PillsListRoute> {
    
    init() {
        super.init(initialRoute: .initial)
    }
    
    override func prepareTransition(for route: PillsListRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let controller = PillsListViewController()
            controller.router = unownedRouter
            controller.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
            return .push(controller)
        }
    }
}
