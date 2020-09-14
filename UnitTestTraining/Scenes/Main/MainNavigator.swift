//
//  MainNavigator.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol MainNavigatorType {
    func toExercise1()
    func toExercise2()
    func toExercise3()
    func toExercise4()
    func toExercise5()
    func toExercise6()
    func toExercise7()
    func toExercise8()
    func toExercise9()
    func toExercise10()
}

struct MainNavigator: MainNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toExercise1() {
        let nav = UINavigationController()
        let vc: Exercise1ViewController = assembler.resolve(navigationController: nav)
        nav.viewControllers = [vc]
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toExercise2() {
        print(#function)
    }
    
    func toExercise3() {
        print(#function)
    }
    
    func toExercise4() {
        let nav = UINavigationController()
        let vc: Exercise4ViewController = assembler.resolve(navigationController: navigationController)
        nav.viewControllers = [vc]
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toExercise5() {
        print(#function)
    }
    
    func toExercise6() {
        print(#function)
    }
    
    func toExercise7() {
        let nav = UINavigationController()
        let vc: Exercise7ViewController = assembler.resolve(navigationController: nav)
        nav.viewControllers = [vc]
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toExercise8() {
        print(#function)
    }
    
    func toExercise9() {
        print(#function)
    }
    
    func toExercise10() {
        print(#function)
    }

}
