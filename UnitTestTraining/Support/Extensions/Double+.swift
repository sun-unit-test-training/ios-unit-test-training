//
//  Double+.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

extension Double {
    var japanCurrency: String {
        return String(format: "%.02f円", self)
    }
}
