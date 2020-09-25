//
//  Exercise10UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by NguyenCK on 9/24/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import ValidatedPropertyKit
import Dto

final class Exercise10UseCaseMock: Exercise10UseCaseType {
    
    // MARK: - calculateRestaurentPromotion
    
    var restaurantPromotionResult = RestaurantPromotion(discount: 1, haveCoupon: false)
    var calculateRestaurantPromotionCalled = false
    
    func calculateRestaurantPromotion(dto: CalculateRestaurantPromotionDto) -> RestaurantPromotion {
        calculateRestaurantPromotionCalled = true
        return restaurantPromotionResult
    }
}
