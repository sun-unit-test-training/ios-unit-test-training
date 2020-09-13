//
//  AppNavigator.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let assembler: Assembler
    unowned let window: UIWindow
    
    func toMain() {
        let nav = UINavigationController()
        let vc: MainViewController = assembler.resolve(navigationController: nav)
        nav.viewControllers = [vc]
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
