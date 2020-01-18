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
import DateScrollPicker

class PillsListViewController: UIViewController, ModuleView {
    
    // MARK: - Dependencies
    var viewModel: PillsListViewModel!
    let dateScrollPicker = DateScrollPicker()
    
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
        title = L10n.test
        setupDateScrollPicker()
    }
    
    private func setupDateScrollPicker() {
        view.addSubview(dateScrollPicker)
        setupScrollPicker()
        dateScrollPicker.translatesAutoresizingMaskIntoConstraints = false
        let height = dateScrollPicker.heightAnchor.constraint(equalToConstant: 100)
        let leadingAnchor = dateScrollPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let trailingAnchor = dateScrollPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let topAnchor = dateScrollPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        NSLayoutConstraint.activate([leadingAnchor, trailingAnchor, height, topAnchor])
    }
    
    // MARK: - Private
    private let _newView = UIButton()
    private let _bag = DisposeBag()
}
