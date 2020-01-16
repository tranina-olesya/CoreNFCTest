//
//  ModuleTransitionable.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

protocol ModuleTransitionable: class {
    func showModule(_ module: UIViewController)
    func dismissView(animated: Bool, completion: (() -> Void)?)
    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func push(module: UIViewController, animated: Bool)
}

extension ModuleTransitionable where Self: UIViewController {

    func showModule(_ module: UIViewController) {
        self.show(module, sender: nil)
    }

    func dismissView(animated: Bool, completion: (() -> Void)?) {
        self.presentingViewController?.dismiss(animated: animated, completion: completion)
    }

    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.present(module, animated: animated, completion: completion)
    }

    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }

    func push(module: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(module, animated: animated)
    }

}
