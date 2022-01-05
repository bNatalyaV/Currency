//
//  BaseRequest.swift
//  Currency
//
//  Created by Natalya Bakatanova on 01.01.2022.
//

import Foundation

class BaseRequest<BaseResponse: Decodable> {
    func url() -> String { "" }
    func path() -> [String: String]? { nil }
    func requestType() -> HTTPMethod { .get }
    func body() -> BaseInput? { nil }
    func headers() -> [String: String]? { nil }
}
