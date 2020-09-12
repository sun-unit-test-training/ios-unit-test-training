//
//  MainUseCase.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

protocol MainUseCaseType {
    func getExercies() -> [Exercise]
}

struct MainUseCase: MainUseCaseType, GettingExercises {
    let exerciseGateway: ExerciseGatewayType
}
