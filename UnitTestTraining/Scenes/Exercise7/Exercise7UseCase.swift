//
//  Exercise7UseCase.swift
//  UnitTestTrainning
//
//  Created by dungkv-1044 on 9/14/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//
import Dto
import RxSwift
import ValidatedPropertyKit

protocol Exercise7UseCaseType {
    func calculationFee(dto: VietnamMartOrderDto) -> (standardFee: Double, quickFee: Double)
    func validateCardAmount(_ amount: String) -> ValidationResult
}

struct Exercise7UseCase: Exercise7UseCaseType, CaculatingTransportationFee {

}
