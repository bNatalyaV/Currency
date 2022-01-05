//
//  GetCurrencyRequest.swift
//  Currency
//
//  Created by Natalya Bakatanova on 01.01.2022.
//

import Foundation

class GetCurrencyRequest: BaseRequest<Currency> {
    override func url() -> String {
        "https://alpha.as50464.net:29870/moby-pre-44/core"
    }
    
    override func path() -> [String: String]? {
        [
            "r": "BEYkZbmV",
            "d": "563B4852-6D4B-49D6-A86E-B273DD520FD2",
            "t": "ExchangeRates",
            "v": "44",
        ]
    }
    
    override func requestType() -> HTTPMethod { .post }
    
    override func body() -> BaseInput? {
        RequestBody(
            uid: "563B4852-6D4B-49D6-A86E-B273DD520FD2",
            type: "ExchangeRates",
            rid: "BEYkZbmV")
    }
    
    override func headers() -> [String : String]? {
        [
            "User-Agent": "Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)",
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
    }
}
