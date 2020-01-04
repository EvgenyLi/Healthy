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
        super.init(initialRoute: .initial)
    }
    
    override func prepareTransition(for route: SettingsRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let controller = SettingsViewController()
            controller.router = unownedRouter
            return .push(controller)
        }
    }
}
