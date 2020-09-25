//
//  GettingHolidays.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

protocol GettingHolidays {
    var dateGateway: DateGatewayType { get }
}

extension GettingHolidays {
    func getHolidays() -> [Date] {
        dateGateway.getHolidays()
    }
}
