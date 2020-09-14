//
//  ClotherViewModel.swift
//  UnitTestTraining
//
//  Created by nguyen.dong.son on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

struct ClotherViewModel {
    let count: String
    let type: ClotherType
    let minusButtonIsEnable: Bool
    
    init(clother: ClotherOrderItem) {
        self.count = "\(clother.total)"
        self.type = clother.type
        self.minusButtonIsEnable = clother.total > 0
    }
}
