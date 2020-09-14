//
//  Exercise3Navigator.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit

protocol Exercise3NavigatorType {

}

struct Exercise3Navigator: Exercise3NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
