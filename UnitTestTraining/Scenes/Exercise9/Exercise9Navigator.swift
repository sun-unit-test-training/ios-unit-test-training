//
//  Exercise9Navigator.swift
//  UnitTestTraining
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise9NavigatorType {
}

struct Exercise9Navigator: Exercise9NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
