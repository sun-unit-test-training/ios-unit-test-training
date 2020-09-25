//
//  Exercise9ViewModel.swift
//  UnitTestTraining
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import MGArchitecture
import RxSwift
import RxCocoa

struct Exercise9ViewModel {
    let navigator: Exercise9NavigatorType
    let useCase: Exercise9UseCaseType
}

extension Exercise9ViewModel: ViewModel {
    struct Input {
        let magicWandSelectionTrigger: Driver<Bool>
        let strategistSelectionTrigger: Driver<Bool>
        let darknessKeySelectionTrigger: Driver<Bool>
        let lightSwordSelectionTrigger: Driver<Bool>
        let hitBigBossTrigger: Driver<Void>
    }

    struct Output {
        @Property var gameResult: HanoiQuestResult = .roomNotFound
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        let bringMagicWand = input.magicWandSelectionTrigger.startWith(false)
        let bringStrategist = input.strategistSelectionTrigger.startWith(false)
        let bringDarknessKey = input.darknessKeySelectionTrigger.startWith(false)
        let bringLightSword = input.lightSwordSelectionTrigger.startWith(false)
        
        input.hitBigBossTrigger.withLatestFrom(
            Driver.combineLatest(bringMagicWand, bringStrategist, bringDarknessKey, bringLightSword)
        ).map { inputValues -> HanoiQuestResult in
            let dto = CalculatingHanoiQuestResultDto(
                bringMagicWand: inputValues.0,
                bringStrategist: inputValues.1,
                bringDarknessKey: inputValues.2,
                bringLightSword: inputValues.3)
            return self.useCase.calculateHanoiQuestResult(dto: dto)
        }
        .drive(output.$gameResult)
        .disposed(by: disposeBag)

        return output
    }
}
