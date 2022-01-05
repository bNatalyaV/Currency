//
//  Currency.swift
//  Currency
//
//  Created by Natalya Bakatanova on 01.01.2022.
//

import Foundation

class Currency: BaseResponse {
    enum CodingKeys: String, CodingKey {
        case code
        case messageTitle
        case message
        case rid
        case downloadDate
        case rates
        case productState
        case ratesDate
    }
    
    let code: Int?
    let messageTitle, message, rid, downloadDate: String?
    let rates: [Rate]?
    let productState: Int?
    let ratesDate: String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int?.self, forKey: .code)
        self.messageTitle = try container.decode(String?.self, forKey: .messageTitle)
        self.message = try container.decode(String?.self, forKey: .message)
        self.rid = try container.decode(String?.self, forKey: .rid)
        self.downloadDate = try container.decode(String?.self, forKey: .downloadDate)
        self.rates = try container.decode([Rate]?.self, forKey: .rates)
        self.productState = try container.decode(Int?.self, forKey: .productState)
        self.ratesDate = try container.decode(String?.self, forKey: .ratesDate)
        try super.init(from: decoder)
    }
}
