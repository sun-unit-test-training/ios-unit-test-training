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
    @Validated(.isNumber(message: "Giá thành phải lớn hơn 0"))
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
    
    func calculateFee(dto: CalculatePizzaFeeDto) -> CalculatePizzaFeeResult {
        var promotions: [PromotionType] = []
        guard var price = Double(dto.priceString ?? ""), dto.validationError == nil else {
            return CalculatePizzaFeeResult(fee: 0.0, promotions: [])
        }
        
        if price > 1500 {
            promotions.append(.freePotato)
        }
        
        if dto.receiveMethod == .takeAway {
            promotions.append(.freeOnMonday)
        } else if dto.usingCoupon && dto.receiveMethod == .deliver {
            promotions.append(.discount20Percent)
            price = price * 0.8
        }
        
        return CalculatePizzaFeeResult(fee: price, promotions: promotions)
    }
}
