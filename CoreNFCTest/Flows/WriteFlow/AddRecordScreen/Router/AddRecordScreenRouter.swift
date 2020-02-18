//
//  AddRecordRouter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class AddRecordScreenRouter {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

}

// MARK: - AddRecordRouterInput

extension AddRecordScreenRouter: AddRecordScreenRouterInput {

    func showAddText(output: TextMessageScreenModuleOutput) {
        let vc = TextMessageScreenModuleConfigurator().configure(output: output)
        view?.push(module: vc, animated: true)
    }

    func showAddContact(output: ContactMessageScreenModuleOutput) {
        let vc = ContactMessageScreenModuleConfigurator().configure(output: output)
        view?.push(module: vc, animated: true)
    }

    func showAddURLMessage(output: URLMessageScreenModuleOutput) {
        let vc = URLMessageInputModuleConfigurator().configure(output: output)
        view?.push(module: vc, animated: true)
    }

}
