//
//  DateScrollPickerFormatConfigurator.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 18/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import DateScrollPicker

extension PillsListViewController {
    
    func scrollPickerConfig() {
        var format = DateScrollPickerFormat()
        format.days = 5
        format.topDateFormat = "MMM"
        format.bottomDateFormat = "EEEE"
        format.topTextColor = UIColor.white.withAlphaComponent(0.9)
        format.mediumTextColor = UIColor.white.withAlphaComponent(0.9)
        format.bottomTextColor = UIColor.white.withAlphaComponent(0.9)
        format.topFont = UIFont(name: "Volte-Regular2", size: 16)!
        format.bottomFont = UIFont(name: "Volte-Regular2", size: 10)!
        format.dayBackgroundColor = UIColor.black.withAlphaComponent(0.8)
        format.dayBackgroundSelectedColor = UIColor(hex: "00CC14")
        format.separatorTopTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBottomTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBackgroundColor = UIColor.white.withAlphaComponent(0.3)
        format.separatorTopFont = UIFont(name: "Volte-Regular3", size: 22)!
        format.separatorTopFont = UIFont(name: "Volte-Regular2", size: 20)!
        format.separatorEnabled = false
        dateScrollPicker.format = format
        dateScrollPicker.delegate = self
        dateScrollPicker.dataSource = self
    }
    
}
