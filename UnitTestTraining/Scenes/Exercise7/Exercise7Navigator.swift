//
//  Exercise7Navigator.swift
//  UnitTestTrainning
//
//  Created by dungkv-1044 on 9/14/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//
import UIKit

protocol Exercise7NavigatorType {

}

struct Exercise7Navigator: Exercise7NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
