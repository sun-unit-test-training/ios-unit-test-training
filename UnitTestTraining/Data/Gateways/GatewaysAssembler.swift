//
//  GatewaysAssembler.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

protocol GatewaysAssembler {
    func resolve() -> ExerciseGatewayType
    func resolve() -> DateGatewayType
    func resolve() -> ArticleGatewayType
}

extension GatewaysAssembler where Self: DefaultAssembler {
    func resolve() -> ExerciseGatewayType {
        return ExerciseGateway()
    }
    
    func resolve() -> DateGatewayType {
        return DateGateway()
    }
    
    func resolve() -> ArticleGatewayType {
        return ArticleGateway()
    }
}
