//
//  AddRecordRouter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class AddRecordRouter {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

}

// MARK: - AddRecordRouterInput

extension AddRecordRouter: AddRecordRouterInput {

    func showAddURLMessage(output: URLMessageInputModuleOutput) {
        let vc = URLMessageInputModuleConfigurator().configure(output: output)
        view?.push(module: vc, animated: true)
    }

}
