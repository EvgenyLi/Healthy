//
//  PillsListViewController.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 04/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import DateScrollPicker
import PinLayout
import RxRealm

class PillsListViewController: UIViewController, ModuleView {
    
    // MARK: - Dependencies
    var viewModel: PillsListViewModel!
    let dateScrollPicker = DateScrollPicker()
   // var dataSource =
    
    // MARK: - Public
    var output: PillsListViewModel.Input {
        return PillsListViewModel.Input(buttonTapped: _newView.rx.tap.asSignal())
    }
    
    func bindViewModel() -> Disposable {
        return Disposables.create([
            viewModel.output.asObservable()
                .bind(onNext: { print($0) })])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = L10n.test
        setupDateScrollPicker()
        
        view.addSubview(_tableView)
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func setupDateScrollPicker() {
        view.addSubview(dateScrollPicker)
        scrollPickerConfig()
    }
    
    override func viewWillLayoutSubviews() {
       super.viewWillLayoutSubviews()
        dateScrollPicker.pin.left().top(view.pin.safeArea).right().height(100).margin(10)
        _tableView.pin.below(of: dateScrollPicker).all(10)
    }
    
    // MARK: - Private
    private let _newView = UIButton()
    private let _tableView = UITableView()
    private let _bag = DisposeBag()
}

extension PillsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}
