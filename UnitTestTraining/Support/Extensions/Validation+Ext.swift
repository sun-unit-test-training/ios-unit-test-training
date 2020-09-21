//
//  Validation+Ext.swift
//  UnitTestTraining
//
//  Created by Dung Khuat on 9/16/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import ValidatedPropertyKit

extension Validation where Value == String {
    public static func isNumber(message: String) -> Validation {
        return .init { value in
            let number = Double(value) ?? 0
            if number > 0 {
                return .success(())
            } else {
                return .failure(ValidationError(message: message))
            }
        }
    }
    
    public static func isValidAge(message: String) -> Validation {
        return .init { value in
            print("value: \(value)")
            guard let age = Int(value) else {
                return .failure(ValidationError(message: message))
            }
            if (0...120).contains(age) {
                return .success(())
            } else {
                return .failure(ValidationError(message: message))
            }
        }
    }
}
