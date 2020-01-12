//
//  ModuleView.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxSwift

public protocol ModuleView: class {

    associatedtype ViewModel: ModuleViewModel

    var output: ViewModel.Input { get }

    var viewModel: ViewModel! { get set }

    func bindViewModel() -> Disposable
}

extension ModuleView where Self: UIViewController {
    func bind(to model: Self.ViewModel) {
        viewModel = model
        loadViewIfNeeded()
        _ = bindViewModel()
        _ = viewModel.setup(with: output)
    }
}

extension ModuleView where Self: UITableViewCell {
    func bind(to model: Self.ViewModel) {
        viewModel = model
        _ = bindViewModel()
    }
}

extension ModuleView where Self: UICollectionViewCell {
    func bind(to model: Self.ViewModel) {
        viewModel = model
        _ = bindViewModel()
    }
}

//public extension ModuleView where Self: NSObjectProtocol {
//    
//    var viewModel: ViewModel {
//        assertMainThread()
//        guard let viewModel = viewModelBox?.viewModel else {
//            fatalError("ViewModel is not bound")
//        }
//        return viewModel
//    }
//}
//
//fileprivate extension ModuleView where Self: NSObjectProtocol {
//
//    var viewModelBox: ViewModelBox<ViewModel>? {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.viewModelBox) as? ViewModelBox<ViewModel>
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKeys.viewModelBox, newValue,
//                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//}
//
//private enum AssociatedKeys {
//    static var viewModelBox: Int32 = 0
//}
//
//private class ViewModelBox<ViewModel> {
//
//    let viewModel: ViewModel
//    let disposeBag = DisposeBag()
//
//    init(_ viewModel: ViewModel) {
//        self.viewModel = viewModel
//    }
//}
