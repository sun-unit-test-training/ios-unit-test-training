//
//  Exercise10Assembler.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/23/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise10Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise10ViewController
    func resolve(navigationController: UINavigationController) -> Exercise10ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise10NavigatorType
    func resolve() -> Exercise10UseCaseType
}

extension Exercise10Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise10ViewController {
        let vc = Exercise10ViewController.instantiate()
        let vm: Exercise10ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> Exercise10ViewModel {
        return Exercise10ViewModel(navigator: resolve(navigationController: navigationController), useCase: resolve())
    }
}

extension Exercise10Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise10NavigatorType {
        return Exercise10Navigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> Exercise10UseCaseType {
        return Exercise10UseCase()
    }
}
