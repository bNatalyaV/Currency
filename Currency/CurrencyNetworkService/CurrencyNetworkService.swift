//
//  CurrencyNetworkService.swift
//  Currency
//
//  Created by Natalya Bakatanova on 02.01.2022.
//

import Foundation

class CurrencyNetworkService {
    private var apiClient: ApiClient?
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getCurrency(competion: @escaping ((Currency?) -> Void)) {
        let request = GetCurrencyRequest()
        
        apiClient?.get(request: request, completion: { response, error in
            competion(response)
        })
    }
}
