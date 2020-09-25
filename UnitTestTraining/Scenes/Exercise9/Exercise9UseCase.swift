//
//  Exercise9UseCase.swift
//  UnitTestTraining
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

protocol Exercise9UseCaseType {
    func calculateHanoiQuestResult(dto: HanoiQuestDto) -> HanoiQuestResult
}

struct Exercise9UseCase: Exercise9UseCaseType, CalculatingHanoiQuestResult {
}
