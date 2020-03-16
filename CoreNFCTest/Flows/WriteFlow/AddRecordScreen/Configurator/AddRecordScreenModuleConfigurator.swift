//
//  AddRecordModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class AddRecordScreenModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: AddRecordScreenModuleOutput? = nil) -> AddRecordScreenViewController {
        guard let view = UIStoryboard(name: String(describing: AddRecordScreenViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? AddRecordScreenViewController else {
            fatalError("Can't load AddRecordViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = AddRecordScreenPresenter()
        let router = AddRecordScreenRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
