//
//  GettingDates.swift
//  UnitTestTraining
//
//  Created by vu.thanh.long on 9/11/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

protocol GettingDates {
    var dateGateway: DateGatewayType { get }
}

extension GettingDates {
    func getHolidays() -> [Date] {
        dateGateway.getHolidays()
    }
    
    func getDateColor(dto: GetDateColorDto) -> UIColor {
        var dayColor = UIColor.black
        let isHoliday = !dto.holidays.filter { dto.date.isSameDay(with: $0 ) }.isEmpty
        if isHoliday || dto.date.dayInWeek() == .sunday {
            dayColor = .red
        } else if dto.date.dayInWeek() == .saturday {
            dayColor = .blue
        }
        return dayColor
    }
}
