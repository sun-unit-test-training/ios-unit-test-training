//
//  Exercise5Assembler.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise5Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise5ViewController
    func resolve(navigationController: UINavigationController) -> Exercise5ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise5NavigatorType
    func resolve() -> Exercise5UseCaseType
}

extension Exercise5Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise5ViewController {
        let vc = Exercise5ViewController.instantiate()
        let vm: Exercise5ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> Exercise5ViewModel {
        return Exercise5ViewModel(navigator: resolve(navigationController: navigationController), useCase: resolve())
    }
}

extension Exercise5Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise5NavigatorType {
        return Exercise5Navigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> Exercise5UseCaseType {
        return Exercise5UseCase()
    }
}
