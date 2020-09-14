//
//  Exercise3Assembler.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit

protocol Exercise3Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise3ViewController
    func resolve(navigationController: UINavigationController) -> Exercise3ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise3NavigatorType
    func resolve() -> Exercise3UseCaseType
}

extension Exercise3Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise3ViewController {
        let vc = Exercise3ViewController.instantiate()
        let vm: Exercise3ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> Exercise3ViewModel {
        return Exercise3ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise3Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise3NavigatorType {
        return Exercise3Navigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> Exercise3UseCaseType {
        return Exercise3UseCase()
    }
}
