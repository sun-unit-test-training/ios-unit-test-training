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

struct PizzaOrderDto: Dto {
    @Validated(.isNumber(message: "Giá thành phải lớn hơn 0"))
    var price: String? = "" // swiftlint:disable:this let_var_whitespace
    
    var priceValue: Double {
        return price.flatMap { Double($0) } ?? 0.0
    }
    
    var receiveMethod: ReceiveMethod = .deliver
    var usingCoupon: Bool = false
    
    var validatedProperties: [ValidatedProperty] {
        return [_price]
    }
}

extension PizzaOrderDto {
    static func validatePizzaPrice(_ price: String) -> Result<String, ValidationError> {
        return PizzaOrderDto()._price.isValid(value: price)
    }
}

protocol CalculatePizzaFee {
    
}

extension CalculatePizzaFee {
    func validatePizzaPrice(_ price: String) -> ValidationResult {
        return PizzaOrderDto.validatePizzaPrice(price).mapToVoid()
    }
    
    func calculateFee(dto: PizzaOrderDto) -> CalculatePizzaFeeResult {
        guard dto.validationError == nil else {
            return CalculatePizzaFeeResult()
        }
        
        var price = dto.priceValue
        var promotions: [PromotionType] = []
        
        if dto.priceValue > 1500 {
            promotions.append(.freePotato)
        }
        
        if dto.receiveMethod == .takeAway {
            promotions.append(.freeOnMonday)
        } else if dto.usingCoupon && dto.receiveMethod == .deliver {
            promotions.append(.discount20Percent)
            price *= 0.8
        }
        
        return CalculatePizzaFeeResult(fee: price, promotions: promotions)
    }
}
