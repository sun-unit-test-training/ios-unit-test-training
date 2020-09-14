//
//  Exercise7Assembler.swift
//  UnitTestTrainning
//
//  Created by dungkv-1044 on 9/14/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable

protocol Exercise7Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise7ViewController
    func resolve(navigationController: UINavigationController) -> Exercise7ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise7NavigatorType
    func resolve() -> Exercise7UseCaseType
}

extension Exercise7Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise7ViewController {
        let vc = Exercise7ViewController.instantiate()
        let vm: Exercise7ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> Exercise7ViewModel {
        return Exercise7ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise7Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise7NavigatorType {
        return Exercise7Navigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> Exercise7UseCaseType {
        return Exercise7UseCase()
    }
}
