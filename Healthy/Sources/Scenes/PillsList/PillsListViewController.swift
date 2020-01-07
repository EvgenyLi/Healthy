//
//  PillsListViewController.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 04/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import XCoordinator
import RxCocoa
import RxSwift

class PillsListViewController: UIViewController, ModuleView {
    
    // MARK: - Dependencies
    var viewModel: PillsListViewModel!
    
    // MARK: - Public
    var output: PillsListViewModel.Input {
        return PillsListViewModel.Input(buttonTapped: _newView.rx.tap.asSignal())
    }
    
    func bindViewModel() -> Disposable {
        return Disposables.create([
            viewModel.output.asObservable()
            .bind(onNext: { print($0) })])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        _newView.backgroundColor = UIColor.red
        view.addSubview(_newView)
        title = L10n.test
        _newView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = _newView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = _newView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let width = _newView.widthAnchor.constraint(equalToConstant: 200)
        let height = _newView.heightAnchor.constraint(equalToConstant: 200)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, width, height])
    }
    
    // MARK: - Private
    private let _newView = UIButton()
    private let _bag = DisposeBag()

}
