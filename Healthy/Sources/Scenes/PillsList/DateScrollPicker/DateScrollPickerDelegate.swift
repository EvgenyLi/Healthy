//
//  DateScrollPickerDelegate.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 18/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import DateScrollPicker

extension PillsListViewController: DateScrollPickerDelegate {
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date) {
        print(date.format(dateFormat: "EEEE, dd MMMM yyyy, h:mm a"))
    }
}
