//
//  Validation+Ext.swift
//  UnitTestTraining
//
//  Created by Dung Khuat on 9/16/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import ValidatedPropertyKit

extension Validation where Value == String {
    public static func isValidCartAmount(message: String) -> Validation {
        return .init { value in
            let cart = Double(value) ?? 0
            if cart > 0 {
                return .success(())
            } else {
                return .failure(ValidationError(message: message))
            }
        }
    }
}
