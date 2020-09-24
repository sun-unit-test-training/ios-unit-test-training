//
//  CalculatingHanoiQuestResult.swift
//  UnitTestTraining
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

struct CalculatingHanoiQuestResultDto: Dto {

    let bringMagicWand: Bool
    let bringStrategist: Bool
    let bringDarknessKey: Bool
    let bringLightSword: Bool

    var validatedProperties: [ValidatedProperty] {
        return []
    }
}

protocol CalculatingHanoiQuestResult {
}

extension CalculatingHanoiQuestResult {

    func calculateHanoiQuestResult(dto: CalculatingHanoiQuestResultDto) -> HanoiQuestResult {
        var result: HanoiQuestResult = .roomNotFound
        if dto.bringMagicWand || dto.bringStrategist {
            result = .roomFound
        }
        if result == .roomFound, dto.bringDarknessKey {
            result = .roomOpened
        }
        if result == .roomOpened, dto.bringLightSword {
            result = .beatBigBoss
        }
        return result
    }
}
