//
//  LoginCoordinator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 04.02.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import XCoordinator

enum LoginRoute: Route {
    case initial
    case main
}

class LoginCoordinator: ViewCoordinator<LoginRoute> {

    init() {
        super.init(rootViewController: .init(), initialRoute: nil)
        trigger(.initial)
    }

    override func prepareTransition(for route: LoginRoute) -> ViewTransition {
        switch route {
        case .initial:
            let controller = LoginViewController.init()
            let viewModel = LoginViewModel.init(router: strongRouter)
            controller.bind(to: viewModel)
            return .embed(controller, in: rootViewController)
        case .main:
            let main = MainCoordinator()
            return .embed(main, in: rootViewController)
        }
    }
}

import UIKit
import XCoordinator

public extension Transition {

    static func unembed(_ embeddedPresentable: Presentable,
                        from container: Container) -> Transition {

        return Transition(presentables: [embeddedPresentable], animationInUse: nil) { rootViewController, options, completion in
            rootViewController.unembed(
                embeddedPresentable.viewController,
                from: container,
                options: options,
                completion: completion
            )
        }
    }
}

private extension UIViewController {

    func unembed(_ embeddedViewController: UIViewController,
                 from container: Container,
                 options: TransitionOptions,
                 completion: PresentationHandler?) {

        embeddedViewController.willMove(toParent: nil)

        embeddedViewController.view.removeFromSuperview()

        let completion: PresentationHandler = {
            embeddedViewController.removeFromParent()
            completion?()
        }

        guard options.animated else {
            completion()
            return
        }
    }
}



