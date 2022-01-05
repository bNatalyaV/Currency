//
//  CurrencyDetailsInteractor.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import Foundation

protocol CurrencyDetailsInteractor {
    var presenter: CurrencyDetailsPresenter? { get set }
}

class CurrencyDetailsInteractorImpl: CurrencyDetailsInteractor {
    var presenter: CurrencyDetailsPresenter?
    
    required init(presenter: CurrencyDetailsPresenter) {
        self.presenter = presenter
    }
}
