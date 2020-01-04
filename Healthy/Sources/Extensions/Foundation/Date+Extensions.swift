//
//  Date+Extensions.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 31/12/2019.
//  Copyright © 2019 Lipadat Evgeniy. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Creates a date using components.
    init(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        
        let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        
        guard let date = Calendar.current.date(from: components) else {
            assertionFailure("could not create date from components")
            self.init()
            return
        }
        
        self = date
    }
}
