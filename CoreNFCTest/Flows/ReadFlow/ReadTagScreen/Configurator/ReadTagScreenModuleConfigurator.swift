//
//  ReadTagScreenModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class ReadTagScreenModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: ReadTagScreenModuleOutput? = nil) -> ReadTagScreenViewController {
        guard let view = UIStoryboard(name: String(describing: ReadTagScreenViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? ReadTagScreenViewController else {
            fatalError("Can't load ReadTagScreenViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = ReadTagScreenPresenter()
        let router = ReadTagScreenRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
