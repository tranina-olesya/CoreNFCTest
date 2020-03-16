//
//  MainTabBarScreenModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class MainTabBarScreenModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: MainTabBarScreenModuleOutput? = nil) -> MainTabBarScreenViewController {
        guard let view = UIStoryboard(name: String(describing: MainTabBarScreenViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? MainTabBarScreenViewController else {
            fatalError("Can't load MainTabBarScreenViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = MainTabBarScreenPresenter()
        let router = MainTabBarScreenRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
