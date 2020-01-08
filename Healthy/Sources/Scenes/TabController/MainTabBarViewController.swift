//
//  MainTabBarController.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 03/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import XCoordinator

class MainTabBarViewController: UITabBarController {

    var router: UnownedRouter<MainRoute>!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }
}
