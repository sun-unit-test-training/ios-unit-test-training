//
//  DateGateway.swift
//  UnitTestTraining
//
//  Created by vu.thanh.long on 9/11/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

protocol DateGatewayType {
    func getHolidays() -> [Date]
}

struct DateGateway: DateGatewayType {
    func getHolidays() -> [Date] {
        let formatter = DateFormatter()
        var holidays = [Date]()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 7)
        (1970...2038).forEach { year in
            if let newYearDay = formatter.date(from: "\(year)/01/01") {
                holidays.append(newYearDay)
            }
            
            if let liberateDay = formatter.date(from: "\(year)/04/30") {
                holidays.append(liberateDay)
            }
            
            if let workedDay = formatter.date(from: "\(year)/05/01") {
                holidays.append(workedDay)
            }
            
            if let nationaDay = formatter.date(from: "\(year)/09/02") {
                holidays.append(nationaDay)
            }
        }
        return holidays
    }
}
