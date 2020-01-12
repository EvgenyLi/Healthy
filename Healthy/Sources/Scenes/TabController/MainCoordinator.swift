//
//  MainCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 03/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import XCoordinator

enum MainRoute: Route {
    case initial
}

final class MainCoordinator: TabBarCoordinator<MainRoute> {

    init() {
        super.init(rootViewController: MainTabBarViewController(), initialRoute: nil)
        trigger(.initial)
    }

    override func prepareTransition(for route: MainRoute) -> TabBarTransition {
        switch route {
        case .initial:
            let pillsList = PillsListCoordinator()
            let visits = VisitsCoordinator()
            let measurements = MeasurementsCoordinator()
            let settings = SettingsCoordinator()
            return .multiple(
            .set([pillsList, visits, measurements, settings]),
            .select(pillsList)
            )
        }
    }
}
