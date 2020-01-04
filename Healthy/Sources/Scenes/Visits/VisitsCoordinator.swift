//
//  VisitsCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 03/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import XCoordinator

enum VisitsRoute: Route {
    case initial
}

class VisitsCoordinator: NavigationCoordinator<VisitsRoute> {
    
    init() {
        super.init(initialRoute: .initial)
    }
    
    override func prepareTransition(for route: VisitsRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let controller = VisitsViewController()
            controller.router = unownedRouter
            return .push(controller)
        }
    }
}
