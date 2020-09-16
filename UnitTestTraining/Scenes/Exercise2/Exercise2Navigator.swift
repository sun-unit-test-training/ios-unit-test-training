//
//  Exercise2Navigator.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit

protocol Exercise2NavigatorType {

}

struct Exercise2Navigator: Exercise2NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
