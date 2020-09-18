//
//  Exersice6Assembler.swift
//  UnitTestTraining
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise6Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise6ViewController
    func resolve(navigationController: UINavigationController) -> Exercise6ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise6NavigatorType
    func resolve() -> Exercise6UseCaseType
}

extension Exercise6Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise6ViewController {
        let vc = Exercise6ViewController.instantiate()
        let vm: Exercise6ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> Exercise6ViewModel {
        return Exercise6ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise6Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise6NavigatorType {
        return Exercise6Navigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> Exercise6UseCaseType {
        return Exercise6UseCase()
    }
}

