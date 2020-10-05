//
//  APIInput.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Alamofire
import MGAPIService

class APIInput: APIInputBase {  // swiftlint:disable:this final_class
    override init(urlString: String,
                  parameters: [String: Any]?,
                  method: HTTPMethod,
                  requireAccessToken: Bool) {
        super.init(urlString: urlString,
                   parameters: parameters,
                   method: method,
                   requireAccessToken: requireAccessToken)
        self.headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
        self.user = nil
        self.password = nil
    }
}
