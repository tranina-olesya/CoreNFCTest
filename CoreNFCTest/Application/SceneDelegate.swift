//
//  SceneDelegate.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 13/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let rootVC = ReadTagScreenModuleConfigurator().configure()

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: rootVC)
        self.window = window
        window.makeKeyAndVisible()
    }

}
