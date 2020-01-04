//
//  PillsListViewController.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 04/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import XCoordinator

class PillsListViewController: UIViewController {
    
    var router: UnownedRouter<PillsListRoute>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}
