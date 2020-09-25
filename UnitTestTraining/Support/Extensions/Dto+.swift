//
//  Dto+.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

extension Dto {
    func validate() throws {
        if let error = self.validationError {
            throw error
        }
    }
    
    var validatedProperties: [ValidatedProperty] {
        return []
    }
}
