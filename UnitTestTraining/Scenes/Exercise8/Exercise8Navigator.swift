//
//  Exercise8Navigator.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise8NavigatorType {

}

struct Exercise8Navigator: Exercise8NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
