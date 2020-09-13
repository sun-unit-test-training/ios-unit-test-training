//
//  Exercise1Assembler.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable

protocol Exercise1Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise1ViewController
    func resolve(navigationController: UINavigationController) -> Exercise1ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise1NavigatorType
    func resolve() -> Exercise1UseCaseType
}

extension Exercise1Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise1ViewController {
        let vc = Exercise1ViewController.instantiate()
        let vm: Exercise1ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> Exercise1ViewModel {
        return Exercise1ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise1Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise1NavigatorType {
        return Exercise1Navigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> Exercise1UseCaseType {
        return Exercise1UseCase()
    }
}
