//
//  NavigationItemType.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17.02.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

enum NavigationItemType {

    case add

    var image: UIImage {
        switch self {
        case .add:
            return UIImage(asset: Asset.NavigationBar.iconAdd)
        }
    }

}
