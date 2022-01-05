//
//  AppDelegate.swift
//  Currency
//
//  Created by Natalya Bakatanova on 01.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        initController()
        return true
    }
    
    private func initController() {
        let vc = CurrencyListController()
        let navigationController = UINavigationController(rootViewController: vc)
        CurrencyListConfiguratorImpl().configure(vc)
        window?.rootViewController = navigationController
    }
    
    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask {
        return .portrait
    }
}
