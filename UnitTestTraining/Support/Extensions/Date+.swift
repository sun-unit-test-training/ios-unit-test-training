//
//  Date+.swift
//  UnitTestTraining
//
//  Created by vu.thanh.long on 9/11/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

extension Date {
    func isSameDay(with date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .day)
            && Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
            && Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }
    
    func dayInWeek() -> DayInWeek {
        let calendar = Calendar(identifier: .gregorian)
        return DayInWeek(rawValue: calendar.dateComponents([.weekday], from: self).weekday ?? 0) ?? .none
    }
    
    enum DayInWeek: Int {
        case none = 0
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }
    
    init?(hour: Int, minute: Int = 0, second: Int = 0) {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        
        guard let date = calendar.date(from: dateComponents) else {
            return nil
        }
        
        self = date
    }
}
