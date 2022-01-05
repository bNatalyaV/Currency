//
//  Rate.swift
//  Currency
//
//  Created by Natalya Bakatanova on 02.01.2022.
//

import Foundation

struct Rate: Codable {
    let tp: Int
    let name: String
    let from: Int
    let currMnemFrom: String
    let to: Int
    let currMnemTo, basic, buy, sale: String
    let deltaBuy, deltaSale: String
}
