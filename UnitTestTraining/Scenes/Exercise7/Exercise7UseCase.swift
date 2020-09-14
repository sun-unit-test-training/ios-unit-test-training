//
//  Exercise7UseCase.swift
//  UnitTestTrainning
//
//  Created by dungkv-1044 on 9/14/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//
import RxSwift

protocol Exercise7UseCaseType {
    func calculationFee(isPremiumMember: Bool,
                        isQuickDeliver: Bool,
                        isCartAmountGreaterThan5000: Bool) -> (standardFee: Double, quickFee: Double)
}

struct Exercise7UseCase: Exercise7UseCaseType, CaculatingTransportationFee {

}
