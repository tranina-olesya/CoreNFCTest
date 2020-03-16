//
//  MainScreenTab.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18.01.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

enum MainScreenTab: CaseIterable {

    case read
    case write

    var title: String {
        switch self {
        case .read:
            return L10n.MainTabBarScreen.ReadTab.title
        case .write:
            return L10n.MainTabBarScreen.WriteTab.title
        }
    }

    var image: UIImage {
        switch self {
        case .read:
            return UIImage(asset: Asset.MainTab.rIcon)
        case .write:
            return UIImage(asset: Asset.MainTab.wIcon)
        }
    }

    var viewController: UIViewController {
        switch self {
        case .read:
            return ReadTagScreenModuleConfigurator().configure()
        case .write:
            return WriteTagScreenModuleConfigurator().configure()
        }
    }

}
