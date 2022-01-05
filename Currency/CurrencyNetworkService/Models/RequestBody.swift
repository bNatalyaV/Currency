//
//  RequestBody.swift
//  Currency
//
//  Created by Natalya Bakatanova on 01.01.2022.
//

import Foundation

class RequestBody: BaseInput {
    internal init(uid: String, type: String, rid: String) {
        self.uid = uid
        self.type = type
        self.rid = rid
    }
    
    let uid: String
    let type: String
    let rid: String
}
