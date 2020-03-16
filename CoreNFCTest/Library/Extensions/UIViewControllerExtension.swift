//
//  UIViewControllerExtension.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17.02.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

extension UIViewController {

    func setLeftNavigationBarItem(type: NavigationItemType, selector: Selector?) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: type.image, style: .plain, target: self, action: selector)
    }

    func setRightNavigationBarItem(type: NavigationItemType, selector: Selector?) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: type.image, style: .plain, target: self, action: selector)
    }

    func setLeftNavigationBarItem(title: String, selector: Selector?) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }

    func setRightNavigationBarItem(title: String, selector: Selector?) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }

}
