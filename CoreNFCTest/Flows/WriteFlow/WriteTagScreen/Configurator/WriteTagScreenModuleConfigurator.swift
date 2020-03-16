//
//  WriteTagScreenModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class WriteTagScreenModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: WriteTagScreenModuleOutput? = nil) -> WriteTagScreenViewController {
        guard let view = UIStoryboard(name: String(describing: WriteTagScreenViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? WriteTagScreenViewController else {
            fatalError("Can't load WriteTagScreenViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = WriteTagScreenPresenter()
        let router = WriteTagScreenRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
