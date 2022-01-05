//
//  CurrencyListPresenter.swift
//  Currency
//
//  Created by Natalya Bakatanova on 02.01.2022.
//

import Foundation
import UIKit

protocol CurrencyListPresenter: AnyObject {
    var router: CurrencyListRouter? { get set }
    var interactor: CurrencyListInteractor? { get set }

    func viewDidLoad()
    func numberOfRowsIn(section: Int) -> Int
    func numberOfSections() -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func didSelectCellFor(indexPath: IndexPath)
    func getInfo() -> [DetailView]
    func updateTable(currencies: Currency?)
}

class CurrencyListPresenterImpl: CurrencyListPresenter {
    weak var view: CurrencyListView?
    var interactor: CurrencyListInteractor?
    var router: CurrencyListRouter?
    var currencies: Currency?
    var models = [CurrencyCellModel]()
    
    required init(view: CurrencyListView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.startLoader()
        interactor?.getCurrencies()
    }
    
    private func prepareModels() {
        models.removeAll()
        currencies?.rates?.forEach({
            models.append(CurrencyCellModel(
                name: $0.name,
                sale: $0.sale,
                buy: $0.buy))
        })
    }
    
    func getInfo() -> [DetailView] {
        var info = [DetailView]()

        info.append(DetailView(text: "Code: \(currencies?.code ?? 0)"))
        info.append(DetailView(text: "Message: \(currencies?.message ?? "")"))
        info.append(DetailView(text: "MessageTitle: \(currencies?.messageTitle ?? "")"))
        info.append(DetailView(text: "Rid: \(currencies?.rid ?? "")"))
        info.append(DetailView(text: "DownloadDate: \(currencies?.downloadDate ?? "")"))
        info.append(DetailView(text: "ProductState: \(currencies?.productState ?? 0)"))
        info.append(DetailView(text: "RatesDate: \(currencies?.ratesDate ?? "")"))
        
        return info
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        currencies?.rates?.count ?? 0
    }
    
    func numberOfSections() -> Int { 1 }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.id, for: indexPath) as? CurrencyCell else { return UITableViewCell() }
        cell.accept(model: models[indexPath.row])
        return cell
    }
    
    func didSelectCellFor(indexPath: IndexPath) {
        guard let rate = currencies?.rates?[indexPath.row] else { return }
        router?.showDetails(rate: rate)
    }
    
    func updateTable(currencies: Currency?) {
        main { [weak self] in
            self?.view?.stopLoader()
            self?.currencies = currencies
            self?.prepareModels()
            self?.view?.reloadData()
        }
    }
}
