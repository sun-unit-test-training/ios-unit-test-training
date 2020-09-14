//
//  Exercise4Navigator.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//
import UIKit

protocol Exercise4NavigatorType {

}

struct Exercise4Navigator: Exercise4NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
