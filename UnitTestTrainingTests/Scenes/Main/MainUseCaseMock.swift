//
//  MainUseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift

final class MainUseCaseMock: MainUseCaseType {
    
    // MARK: - getExercies
    
    var getExerciesCalled = false
    var getExerciesReturnValue = (1...11).map { Exercise(id: $0, title: "Exercise \($0)") }
    
    func getExercies() -> [Exercise] {
        getExerciesCalled = true
        return getExerciesReturnValue
    }
}
