//
//  String+Ext.swift
//  UnitTestTraining
//
//  Created by Dung Khuat on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
extension String {
    func toDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 7)
        return formatter.date(from: self) ?? Date()
    }
}
