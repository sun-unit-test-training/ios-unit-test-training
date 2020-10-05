//
//  Assembler.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

protocol Assembler: class,
    Exercise1Assembler,
    Exercise2Assembler,
    Exercise4Assembler,
    Exercise5Assembler,
    Exercise6Assembler,
    Exercise7Assembler,
    Exercise8Assembler,
    Exercise9Assembler,
    Exercise10Assembler,
    Exercise11Assembler,
    MainAssembler,
    GatewaysAssembler,
    Exercise3Assembler,
    AppAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
