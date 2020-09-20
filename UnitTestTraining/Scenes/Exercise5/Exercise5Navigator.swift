//
//  Exercise5Navigator.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise5NavigatorType {
    
}

struct Exercise5Navigator: Exercise5NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
