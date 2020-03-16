//
//  AppDelegate.swift
//  TypedIDExample
//
//  Created by A431759 on 3/16/20.
//  Copyright © 2020 TLG. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let jsonDataURL = Bundle.main.url(forResource: "example", withExtension: "json")!
        let jsonData = try! Data(contentsOf: jsonDataURL)
        let codableModels = decodeModelsUsingCodable(data: jsonData)
        print("Codable String Model: \(String(describing: codableModels.0)) \nCodable Typed Model: \(String(describing: codableModels.1))")
        let dictModels = decodeModelsUsingDict(data: jsonData)
        print("Dictionary String Model: \(String(describing: dictModels.0)) \nDictionary Typed Model: \(String(describing: dictModels.1))")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    
}

