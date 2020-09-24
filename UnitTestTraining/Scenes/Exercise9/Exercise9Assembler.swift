//
//  Exercise9Assembler.swift
//  UnitTestTraining
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise9Assembler {

    func resolve(navigationController: UINavigationController) -> Exercise9ViewController
    func resolve(navigationController: UINavigationController) -> Exercise9ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise9NavigatorType
    func resolve() -> Exercise9UseCaseType
}

extension Exercise9Assembler {

    func resolve(navigationController: UINavigationController) -> Exercise9ViewController {
        let vc = Exercise9ViewController.instantiate()
        let vm: Exercise9ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> Exercise9ViewModel {
        return Exercise9ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise1Assembler where Self: DefaultAssembler {

    func resolve(navigationController: UINavigationController) -> Exercise9NavigatorType {
        return Exercise9Navigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> Exercise9UseCaseType {
        return Exercise9UseCase()
    }
}
