//
//  MainAssembler.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Tuan Truong. All rights reserved.
//

import UIKit
import Reusable

protocol MainAssembler {
    func resolve(window: UIWindow) -> MainViewController
    func resolve(window: UIWindow) -> MainViewModel
    func resolve(window: UIWindow) -> MainNavigatorType
    func resolve() -> MainUseCaseType
}

extension MainAssembler {
    func resolve(window: UIWindow) -> MainViewController {
        let vc = MainViewController.instantiate()
        let vm: MainViewModel = resolve(window: window)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(window: UIWindow) -> MainViewModel {
        return MainViewModel(
            navigator: resolve(window: window),
            useCase: resolve()
        )
    }
}

extension MainAssembler where Self: DefaultAssembler {
    func resolve(window: UIWindow) -> MainNavigatorType {
        return MainNavigator(assembler: self, window: window)
    }
    
    func resolve() -> MainUseCaseType {
        return MainUseCase()
    }
}
