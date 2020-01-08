//
//  UIViewController+Rx.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 02/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

public extension Reactive where Base: UIViewController {

    var viewLoaded: ControlEvent<Void> {
        return ControlEvent(events: methodInvoked(#selector(UIViewController.viewDidLoad)).mapTo(()))
    }

    var viewAppearing: ControlEvent<Void> {
        return ControlEvent(events: methodInvoked(#selector(UIViewController.viewWillAppear)).mapTo(()))
    }

    var viewAppeared: ControlEvent<Void> {
        return ControlEvent(events: methodInvoked(#selector(UIViewController.viewDidAppear)).mapTo(()))
    }

    var viewDisappearing: ControlEvent<Void> {
        return ControlEvent(events: methodInvoked(#selector(UIViewController.viewWillDisappear)).mapTo(()))
    }

    var viewDisappeared: ControlEvent<Void> {
        return ControlEvent(events: methodInvoked(#selector(UIViewController.viewDidDisappear)).mapTo(()))
    }
}
