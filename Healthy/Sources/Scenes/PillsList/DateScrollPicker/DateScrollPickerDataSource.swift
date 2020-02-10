//
//  DateScrollPickerDataSource.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 18/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import DateScrollPicker

extension PillsListViewController: DateScrollPickerDataSource {
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, mediumAttributedStringByDate date: Date) -> NSAttributedString? {
        if dateScrollPicker === dateScrollPicker {
            let attributes1 = [NSAttributedString.Key.font: UIFont(name: "Volte-Regular3", size: 36)!]
            let attributes2 = [NSAttributedString.Key.font: UIFont(name: "Volte-Regular2", size: 10)!]
            let attributed = NSMutableAttributedString(string: date.format(dateFormat: "dd EEE").uppercased())
            attributed.addAttributes(attributes1, range: NSRange(location: 0, length: 2))
            attributed.addAttributes(attributes2, range: NSRange(location: 2, length: 4))
            return attributed
        } else {
            return nil
        }
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dataAttributedStringByDate date: Date) -> NSAttributedString? {
        if dateScrollPicker === dateScrollPicker {
            let attributes = [NSAttributedString.Key.font: UIFont(name: "Volte-Regular2", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.white]
            return Date.today() == date ? NSAttributedString(string: "3 events", attributes: attributes) : nil
        } else {
            return nil
        }
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dotColorByDate date: Date) -> UIColor? {
        if Date.today() == date { return .yellow }
        if Date.today().addDays(1) == date { return UIColor(hex: "00FF1A") }
        if Date.today().addDays(-1) == date { return UIColor(hex: "00FF1A") }
        return UIColor.white.withAlphaComponent(0.1)
    }
}
