//
//  CurrencyListRouter.swift
//  Currency
//
//  Created by Natalya Bakatanova on 02.01.2022.
//

import Foundation
import UIKit

protocol CurrencyListRouter {
    func showDetails(rate: Rate) 
}

class CurrencyListRouterImpl: CurrencyListRouter {
    
    weak var view: (CurrencyListView & UIViewController)?
    
    required init(view: (CurrencyListView & UIViewController)?) {
        self.view = view
    }
    
    func showDetails(rate: Rate) {
        let navigation = view?.navigationController
        let detailsVC = CurrencyDetailsController()
        CurrencyDetailsConfiguratorImpl().configure(detailsVC, rate: rate)
        navigation?.pushViewController(detailsVC, animated: true)
    }
}
