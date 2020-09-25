//
//  Exercise10Navigator.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/23/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise10NavigatorType {
    
}

struct Exercise10Navigator: Exercise10NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
