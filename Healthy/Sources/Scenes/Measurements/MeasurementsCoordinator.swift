//
//  MeasurementsCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 03/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import XCoordinator

enum MeasurementsRoute: Route {
    case initial
}

class MeasurementsCoordinator: NavigationCoordinator<MeasurementsRoute> {

    init() {
        super.init(initialRoute: nil)
        trigger(.initial)
    }

    override func prepareTransition(for route: MeasurementsRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let controller = MeasurementsViewController.init()
            controller.router = unownedRouter

            controller.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
            return .push(controller)
        }
    }
}
