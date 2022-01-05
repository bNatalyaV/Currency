//
//  DispatchQueue + public.swift
//  Currency
//
//  Created by Natalya Bakatanova on 03.01.2022.
//

import Foundation

public func main(task: @escaping () -> ()) {
    DispatchQueue.main.async {
        task()
    }
}
