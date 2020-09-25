//
//  Exercise10UseCase.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/23/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto
import ValidatedPropertyKit

protocol Exercise10UseCaseType {
    func calculateRestaurantPromotion(dto: RestaurantPromotionDto) -> RestaurantPromotion
}

struct Exercise10UseCase: Exercise10UseCaseType, CalculateRestaurantPromotion {
}
