//
//  Exercise1Navigator.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise1NavigatorType {
    
}

struct Exercise1Navigator: Exercise1NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
