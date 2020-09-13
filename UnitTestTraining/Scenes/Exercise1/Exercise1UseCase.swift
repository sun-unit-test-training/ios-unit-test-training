//
//  Exercise1UseCase.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import RxSwift

protocol Exercise1UseCaseType {
    func calculateBeerPrice(usingVoucher: Bool, isInPromotionTime: Bool) -> Double
}

struct Exercise1UseCase: Exercise1UseCaseType, CalculatingBeerPrice {

}
