//
//  DetailView.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import UIKit

class DetailView: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor.mainColor()
        label.numberOfLines = 0
        return label
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        label.text = text
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
