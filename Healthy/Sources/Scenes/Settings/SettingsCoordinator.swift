//
//  SettingsCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 03/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import XCoordinator

enum SettingsRoute: Route {
    case initial
}

final class SettingsCoordinator: NavigationCoordinator<SettingsRoute> {

    init() {
        super.init(initialRoute: nil)
        trigger(.initial)
    }

    override func prepareTransition(for route: SettingsRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let controller = SettingsViewController.init()
            controller.router = unownedRouter

            controller.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
            return .push(controller)
        }
    }
}
