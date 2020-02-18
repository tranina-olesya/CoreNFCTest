//
//  TextMessageScreenModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class TextMessageScreenModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: TextMessageScreenModuleOutput? = nil) -> TextMessageScreenViewController {
        guard let view = UIStoryboard(name: String(describing: TextMessageScreenViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TextMessageScreenViewController else {
            fatalError("Can't load TextMessageScreenViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TextMessageScreenPresenter()
        let router = TextMessageScreenRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
