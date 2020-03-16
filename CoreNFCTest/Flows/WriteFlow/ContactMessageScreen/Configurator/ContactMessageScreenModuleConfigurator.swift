//
//  ContactMessageScreenModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class ContactMessageScreenModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: ContactMessageScreenModuleOutput? = nil) -> ContactMessageScreenViewController {
        guard let view = UIStoryboard(name: String(describing: ContactMessageScreenViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? ContactMessageScreenViewController else {
            fatalError("Can't load ContactMessageInputViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = ContactMessageScreenPresenter()
        let router = ContactMessageScreenRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
