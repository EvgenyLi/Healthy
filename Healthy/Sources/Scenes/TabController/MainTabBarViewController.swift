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
        let pillsList = PillsListViewController()
        pillsList.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let visits = VisitsViewController()
        visits.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let measurements = MeasurementsViewController()
        measurements.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        let settings = SettingsViewController()
        settings.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        
        let tabBarList = [pillsList, visits, measurements, settings]
        viewControllers = tabBarList
    }
}
