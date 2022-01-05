//
//  CurrencyListView.swift
//  Currency
//
//  Created by Natalya Bakatanova on 02.01.2022.
//

import Foundation
import UIKit
import SnapKit

protocol CurrencyListView: AnyObject {
    func reloadData()
    func startLoader()
    func stopLoader()
}

class CurrencyListController: UIViewController, CurrencyListView {
    var presenter: CurrencyListPresenter?
    
    let tableView = UITableView()
    let loader = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setup()
        view.backgroundColor = UIColor.baseBackgroundColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.topItem?.title = "Exchange Rates"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.mainColor()]
    }
    
    private func setup() {
        setupTableView()
        addSubviews()
        addConstraints()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.id)
        tableView.layer.cornerRadius = 16
        tableView.backgroundColor = UIColor.baseBackgroundColor()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Int.baseSmallOffset)
            $0.trailing.equalToSuperview().offset(-Int.baseSmallOffset)
            $0.top.equalToSuperview().offset(Int.navigationHeight)
            $0.bottom.equalToSuperview().offset(-Int.baseOffset)
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func startLoader() {
        loader.color = .black
        tableView.addSubview(loader)
        loader.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.height.width.equalTo(40)
        }
        loader.startAnimating()
    }
    
    func stopLoader() {
        loader.removeFromSuperview()
        loader.stopAnimating()
    }
    
    func configHeaderView(info: [DetailView]) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.alignment = .leading
            stackView.axis = .vertical
            stackView.distribution = .fillProportionally
            return stackView
        }()
        info.forEach({
            stackView.addArrangedSubview($0)
        })
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }
}

extension CurrencyListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

extension CurrencyListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter?.cellForRowAt(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsIn(section: section) ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectCellFor(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let info = presenter?.getInfo() ?? []
        let view = configHeaderView(info: info)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        150
    }
}
