//
//  NetworkApiClient.swift
//  Currency
//
//  Created by Natalya Bakatanova on 01.01.2022.
//

import Foundation

protocol ApiClient {
    func get<T: Decodable>(
        request: BaseRequest<T>,
        completion: @escaping ((T?, Error?) -> Void)
    )
}

final class NetworkApiClient: ApiClient {
    func get<T: Decodable>(
        request: BaseRequest<T>,
        completion: @escaping ((T?, Error?) -> Void)
    ) {
        var urlString = request.url()
        if let path = request.path() {
            urlString += "?"
            path.forEach { key, value in
                urlString += "\(key)=\(value)&"
            }
            urlString.removeLast()
        }
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        
        if let headers = request.headers() {
            headers.forEach { key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        urlRequest.httpMethod = request.requestType().rawValue
        
        if let body = request.body() {
            do {
                let encodedData = try JSONEncoder().encode(body)
                urlRequest.httpBody = encodedData
            } catch {
                print(error)
            }
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
                return
            } catch {
                print(error)
                completion(nil, error)
                return
            }
        }.resume()
    }
}
