//
//  CalculateRestaurantPromotion.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/23/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto
import ValidatedPropertyKit

struct CalculateRestaurantPromotionDto: Dto {
    var memberRank: MemberRank = .silver
    var prepaidPaymentLimit: Int = 0
    var participateLottery = false
    
    var validatedProperties: [ValidatedProperty] {
        return []
    }
}

protocol CalculateRestaurantPromotion {

}

extension CalculateRestaurantPromotion {
    func calculateRestaurantPromotion(dto: CalculateRestaurantPromotionDto) -> RestaurantPromotion {
        let haveChance = dto.prepaidPaymentLimit >= 5000
        
        switch dto.memberRank {
        case .silver:
            let bonus = (dto.prepaidPaymentLimit <= 3000) ? 1 : (dto.prepaidPaymentLimit <= 5000 ? 2 : 4)
            return RestaurantPromotion(discount: bonus, haveCoupon: dto.participateLottery && haveChance)
        case .gold:
            let bonus = (dto.prepaidPaymentLimit <= 3000) ? 3 : (dto.prepaidPaymentLimit <= 5000 ? 5 : 10)
            return RestaurantPromotion(discount: bonus, haveCoupon: dto.participateLottery && haveChance)
        case .black:
            let bonus = (dto.prepaidPaymentLimit <= 3000) ? 5 : (dto.prepaidPaymentLimit <= 5000 ? 7 : 15)
            return RestaurantPromotion(discount: bonus, haveCoupon: dto.participateLottery && haveChance)
        }
    }
}
