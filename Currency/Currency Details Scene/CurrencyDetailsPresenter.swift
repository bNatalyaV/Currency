//
//  CurrencyDetailsPresenter.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import Foundation

protocol CurrencyDetailsPresenter {
    var interactor: CurrencyDetailsInteractor? { get set }
    var router: CurrencyDetailsRouter? { get set }
    func viewDidLoad()
}

class CurrencyDetailsPresenterImpl: CurrencyDetailsPresenter {
    weak var view: CurrencyDetailsView?
    var interactor: CurrencyDetailsInteractor?
    var router: CurrencyDetailsRouter?
    var rate: Rate?
    var detailViews = [DetailView]()
    
    required init(view: CurrencyDetailsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        prepareStrings()
        view?.fillInfo(texts: detailViews)
    }
    
    private func prepareStrings() {
        var info = [String]()

        info.append("tp: \(rate?.tp ?? 0)")
        info.append("name: \(rate?.name ?? "")")
        info.append("from: \(rate?.from ?? 0)")
        info.append("currMnemFrom: \(rate?.currMnemFrom ?? "")")
        info.append("to: \(rate?.to ?? 0)")
        info.append("currMnemTo: \(rate?.currMnemTo ?? "")")
        info.append("basic: \(rate?.basic ?? "")")
        info.append("buy: \(rate?.buy ?? "")")
        info.append("sale: \(rate?.sale ?? "")")
        info.append("deltaBuy: \(rate?.deltaBuy ?? "")")
        info.append("deltaSale: \(rate?.deltaSale ?? "")")
        
        info.forEach({
            detailViews.append(DetailView(text: $0))
        })
    }
}
