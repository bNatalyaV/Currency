//
//  CurrencyListConfigurator.swift
//  Currency
//
//  Created by Natalya Bakatanova on 02.01.2022.
//

import Foundation

protocol CurrencyListConfigurator {
    func configure(_ view: CurrencyListController)
}

class CurrencyListConfiguratorImpl: CurrencyListConfigurator {
    func configure(_ view: CurrencyListController) {
        let presenter = CurrencyListPresenterImpl(view: view)
        let router = CurrencyListRouterImpl(view: view)
        let interactor = CurrencyListInteractorImpl(presenter: presenter)
        interactor.networkService = CurrencyNetworkService(apiClient: NetworkApiClient())
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
