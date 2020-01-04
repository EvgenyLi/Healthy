//
//  ModuleViewModel.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import RxSwift

public protocol ModuleViewModel: class {
    
    associatedtype Input
    
    func setup(with input: Input) -> Disposable
    
    init()
}
