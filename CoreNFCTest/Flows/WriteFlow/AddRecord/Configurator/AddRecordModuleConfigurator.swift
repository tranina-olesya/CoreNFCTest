//
//  AddRecordModuleConfigurator.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class AddRecordModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: AddRecordModuleOutput? = nil) -> AddRecordViewController {
        guard let view = UIStoryboard(name: String(describing: AddRecordViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? AddRecordViewController else {
            fatalError("Can't load AddRecordViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = AddRecordPresenter()
        let router = AddRecordRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
