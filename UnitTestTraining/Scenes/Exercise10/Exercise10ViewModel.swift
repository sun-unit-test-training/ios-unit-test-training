//
//  Exercise10ViewModel.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/23/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import RxSwift
import RxCocoa
import MGArchitecture

struct Exercise10ViewModel {
    let navigator: Exercise10NavigatorType
    let useCase: Exercise10UseCaseType
}

// MARK: - ViewModel

extension Exercise10ViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let memberRankTrigger: Driver<Int>
        let prepaidTypeTrigger: Driver<Int>
        let participateLotteryTrigger: Driver<Bool>
    }
    
    struct Output {
        @Property var restaurantPromotion = RestaurantPromotion(discount: 0, haveCoupon: false)
        @Property var availableToParticipateLottery = false
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let memberRank = input.memberRankTrigger.map { MemberRank(rawValue: $0) ?? .silver }.startWith(.silver)
        let prepaidType = input.prepaidTypeTrigger.map { PrepaidCardType(index: $0) }.startWith(.value3000)
        let participateLottery = input.participateLotteryTrigger.startWith(false)
        
        Driver.merge(input.loadTrigger,
                     input.memberRankTrigger.mapToVoid(),
                     input.prepaidTypeTrigger.mapToVoid(),
                     input.participateLotteryTrigger.mapToVoid()
            )
            .withLatestFrom(Driver.combineLatest(memberRank, prepaidType, participateLottery))
            .map { (memberRank, prepaidType, participateLottery) -> RestaurantPromotion in
                let dto = RestaurantPromotionDto(memberRank: memberRank,
                                                 prepaidPaymentLimit: prepaidType.rawValue,
                                                 participateLottery: participateLottery)
                return self.useCase.calculateRestaurantPromotion(dto: dto)
            }
            .drive(output.$restaurantPromotion)
            .disposed(by: disposeBag)
        
        prepaidType
            .map { $0 == .value3000 }
            .drive(output.$availableToParticipateLottery)
            .disposed(by: disposeBag)
        
        return output
    }
}
