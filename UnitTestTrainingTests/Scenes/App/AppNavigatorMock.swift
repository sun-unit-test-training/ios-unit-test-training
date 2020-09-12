//
//  AppNavigatorMock.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining

final class AppNavigatorMock: AppNavigatorType {
    
    // MARK: - toMain
    
    var toMainCalled = false
    
    func toMain() {
        toMainCalled = true
    }
}
