//
//  CalculatePizzaFee.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto
import ValidatedPropertyKit

struct CalculatePizzaFeeDto: Dto {
    @Validated(.isValidPizzaPrice(message: "Giá thành phải lớn hơn 0"))
    var priceString: String? = ""
    var receiveMethod: ReceiveMethod = .deliver
    var usingCoupon: Bool = false
    
    var validatedProperties: [ValidatedProperty] {
        return [_priceString]
    }
}

extension CalculatePizzaFeeDto {
    static func validatePizzaPrice(_ price: String) -> Result<String, ValidationError> {
        return CalculatePizzaFeeDto()._priceString.isValid(value: price)
    }
}

protocol CalculatePizzaFee {
    
}

extension CalculatePizzaFee {
    func validatePizzaPrice(_ price: String) -> ValidationResult {
        return CalculatePizzaFeeDto.validatePizzaPrice(price).mapToVoid()
    }
    
    func calculateFee(dto: CalculatePizzaFeeDto) -> (fee: Double, promotions: [PromotionType]) {
        var promotions: [PromotionType] = []
        guard var price = Double(dto.priceString ?? "") else {
            return (fee: 0, promotions: [])
        }
        
        if price > 1500 {
            promotions.append(.freePotato)
        }
        if dto.receiveMethod == .takeAway {
            promotions.append(.freeOnMonday)
        } else {
            if dto.usingCoupon {
                promotions.append(.discount20Percent)
                price = price * 0.8
            }
        }
        
        return (fee: price, promotions: promotions)
    }
}
