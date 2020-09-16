//
//  CalculatingFee.swift
//  UnitTestTraining
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

struct CalculateChargeFeeDto: Dto {
    let isVIP: Bool
    let date: Date
    let holidays: [Date]
    
    var validatedProperties: [ValidatedProperty] {
        return []
    }
}

protocol CalculatingFee {
    
}

extension CalculatingFee {
    
    func calculateFee(dto: CalculateChargeFeeDto) -> Int {
        guard !dto.isVIP else { return 0 }
        
        let calendar = Calendar.current
        let currentDate = dto.date
        // 1 is Sunday and 7 is Saturday
        let currentWeekDay = calendar.component(.weekday, from: currentDate)
        
        let startFreeTime = calendar.date(bySettingHour: 8,
                                          minute: 45,
                                          second: 0,
                                          of: currentDate) ?? currentDate
        let endFreeTime = calendar.date(bySettingHour: 17,
                                        minute: 59,
                                        second: 0,
                                        of: currentDate) ?? currentDate
        let isInFreeTime = currentDate >= startFreeTime && currentDate <= endFreeTime
        let isHoliday = !dto.holidays.filter { dto.date.isSameDay(with: $0 ) }.isEmpty
        let isWeekend = currentWeekDay == 1 || currentWeekDay == 7
        
        if isHoliday || isWeekend {
            return 110
        } else {
            return isInFreeTime ? 0 : 110
        }
    }
 }
