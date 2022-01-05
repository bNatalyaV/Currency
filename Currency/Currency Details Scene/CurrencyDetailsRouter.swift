//
//  CurrencyDetailsRouter.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import Foundation

protocol CurrencyDetailsRouter {
    
}

class CurrencyDetailsRouterImpl: CurrencyDetailsRouter {
    weak var viewController: CurrencyDetailsController?
    
    required init(viewController: CurrencyDetailsController?) {
        self.viewController = viewController
    }
}
