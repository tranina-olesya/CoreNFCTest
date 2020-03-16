//
//  URLMessageInputModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class URLMessageInputModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: URLMessageScreenModuleOutput? = nil) -> URLMessageScreenViewController {
        guard let view = UIStoryboard(name: String(describing: URLMessageScreenViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? URLMessageScreenViewController else {
            fatalError("Can't load URLMessageInputViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = URLMessageScreenPresenter()
        let router = URLMessageScreenRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
