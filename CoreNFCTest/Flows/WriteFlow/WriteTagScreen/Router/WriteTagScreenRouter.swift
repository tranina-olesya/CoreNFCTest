//
//  WriteTagScreenRouter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class WriteTagScreenRouter {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

}

// MARK: - WriteTagScreenRouterInput

extension WriteTagScreenRouter: WriteTagScreenRouterInput {

    func showAddRecordScreen(output: AddRecordModuleOutput) {
        let addRecordScreen = AddRecordModuleConfigurator().configure(output: output)
        view?.push(module: addRecordScreen, animated: true)
    }

}
