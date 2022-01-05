//
//  CurrencyDetailsView.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import Foundation
import UIKit

protocol CurrencyDetailsView: AnyObject {
    func fillInfo(texts: [DetailView])
}

class CurrencyDetailsController: UIViewController, CurrencyDetailsView {
    var presenter: CurrencyDetailsPresenter?
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .baseBackgroundColor()
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Int.navigationHeight + Int.baseOffset)
            $0.leading.equalToSuperview().offset(Int.baseSmallOffset)
            $0.trailing.equalToSuperview().offset(-Int.baseSmallOffset)
            $0.height.equalTo(UIScreen.main.bounds.height / 2)
        }
    }
    
    func fillInfo(texts: [DetailView]) {
        texts.forEach({
            stackView.addArrangedSubview($0)
        })
    }
}
