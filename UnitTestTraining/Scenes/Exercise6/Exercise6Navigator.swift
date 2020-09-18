//
//  Exercise6Navigator.swift
//  UnitTestTraining
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise6NavigatorType {
    
}

struct Exercise6Navigator: Exercise6NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}

