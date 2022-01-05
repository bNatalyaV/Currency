//
//  CurrencyDetailsConfigurator.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import Foundation

protocol CurrencyDetailsConfigurator {
    func configure(_ view: CurrencyDetailsController, rate: Rate?)
}

class CurrencyDetailsConfiguratorImpl: CurrencyDetailsConfigurator {
    func configure(_ view: CurrencyDetailsController, rate: Rate?) {
        let presenter = CurrencyDetailsPresenterImpl(view: view)
        let interactor = CurrencyDetailsInteractorImpl(presenter: presenter)
        let router = CurrencyDetailsRouterImpl(viewController: view)
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.rate = rate
    }
}
