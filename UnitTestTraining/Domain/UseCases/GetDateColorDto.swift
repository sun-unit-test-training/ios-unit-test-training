//
//  GetDateColorDto.swift
//  UnitTestTraining
//
//  Created by vu.thanh.long on 9/11/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

struct GetDateColorDto: Dto {
    var date: Date
    var holidays: [Date]
    
    var validatedProperties: [ValidatedProperty] {
        return []
    }
}
