//
//  GetArticlesDto.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto

struct GetArticlesDto: Dto {
    var query: String
    var apiKey: String
    var page = 1
    var pageSize = 10
}
