//
//  CurrencyListInteractor.swift
//  Currency
//
//  Created by Natalya Bakatanova on 02.01.2022.
//

import Foundation

protocol CurrencyListInteractor {
    var presenter: CurrencyListPresenter? { get set }
    func getCurrencies()
}

class CurrencyListInteractorImpl: CurrencyListInteractor {
    weak var presenter: CurrencyListPresenter?
    var networkService: CurrencyNetworkService?
    
    required init(presenter: CurrencyListPresenter) {
        self.presenter = presenter
    }
    
    func getCurrencies() {
        networkService?.getCurrency(competion: { [weak self] currencies in
            self?.presenter?.updateTable(currencies: currencies)
        })
    }
}
