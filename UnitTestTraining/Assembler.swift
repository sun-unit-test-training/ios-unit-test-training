//
//  Assembler.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

protocol Assembler: class,
    MainAssembler,
    GatewaysAssembler,
    AppAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
