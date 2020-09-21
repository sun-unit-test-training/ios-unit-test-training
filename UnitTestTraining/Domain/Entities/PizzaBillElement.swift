//
//  PizzaBillElement.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/21/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

enum ReceiveMethod: Int {
    case deliver
    case takeAway
}

enum PromotionType {
    case discount20Percent
    case freePotato
    case freeOnMonday
    case none
}

struct CalculatePizzaFeeResult {
    let fee: Double
    let promotions: [PromotionType]
}
