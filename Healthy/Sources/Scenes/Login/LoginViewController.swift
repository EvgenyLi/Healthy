//
//  LoginViewController.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 04.02.2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import PinLayout

class LoginViewController: UIViewController, ModuleView {
    
    // MARK: - Dependencies
    var viewModel: LoginViewModel!
    
    // MARK: - Public
    var output: LoginViewModel.Input {
        return LoginViewModel.Input(login: loginButton.rx.tap.asSignal())
    }
    
    func bindViewModel() -> Disposable {
        return Disposables.create()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(loginButton)
    }
    
    deinit {
        print("Was deinited")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loginButton.pin.hCenter().vCenter().height(50).width(100)
    }
    
    // MARK: Private
    
    private let _bag = DisposeBag()
    private let loginButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Login", for: .normal)
        bt.backgroundColor = .black
        return bt
    }()
}
