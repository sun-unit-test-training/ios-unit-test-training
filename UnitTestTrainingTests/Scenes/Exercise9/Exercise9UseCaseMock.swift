//
//  Exercise9UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining

final class Exercise9UseCaseMock: Exercise9UseCaseType {

    // MARK: - calculateHanoiQuestResult

    var calculateHanoiQuestResultCalled = false
    var calculateHanoiQuestResultReturnValue: HanoiQuestResult = .roomNotFound
    var bringMagicWand = false
    var bringStrategist = false
    var bringDarknessKey = false
    var bringLightSword = false

    func calculateHanoiQuestResult(dto: HanoiQuestDto) -> HanoiQuestResult {
        calculateHanoiQuestResultCalled = true
        self.bringMagicWand = dto.bringMagicWand
        self.bringStrategist = dto.bringStrategist
        self.bringDarknessKey = dto.bringDarknessKey
        self.bringLightSword = dto.bringLightSword
        return calculateHanoiQuestResultReturnValue
    }
}
