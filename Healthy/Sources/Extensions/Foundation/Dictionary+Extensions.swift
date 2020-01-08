//
//  Dictionary+Extensions.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import Foundation

extension Dictionary {

    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach {
            updateValue($0.value, forKey: $0.key)
        }
    }

    func merged(with dictionary: Dictionary) -> Dictionary {
        var result = self
        result.merge(with: dictionary)
        return result
    }
}
