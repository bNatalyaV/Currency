//
//  CurrencyCell.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import Foundation
import UIKit
import SnapKit

struct CurrencyCellModel {
    let name: String
    let sale: String
    let buy: String
}

class CurrencyCell: UITableViewCell {
    static let id = "CurrencyCell"
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    let saleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    let buyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    func accept(model: CurrencyCellModel) {
        label.text = model.name
        saleLabel.text = "Sale: \(model.sale)"
        buyLabel.text = "Buy: \(model.buy)"
        setup()
    }
    
    private func setup() {
        backgroundColor = .baseBackgroundColor()
        contentView.addSubview(label)
        contentView.addSubview(saleLabel)
        contentView.addSubview(buyLabel)

        label.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-8)
        }
        saleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-8)
            $0.trailing.greaterThanOrEqualTo(buyLabel.snp.leading).offset(-20)
        }
        buyLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.trailing.equalToSuperview()
        }
    }
}
