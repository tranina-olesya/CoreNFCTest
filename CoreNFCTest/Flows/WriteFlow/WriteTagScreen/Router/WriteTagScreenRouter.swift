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

    func showAddRecordScreen(output: AddRecordScreenModuleOutput) {
        let addRecordScreen = AddRecordScreenModuleConfigurator().configure(output: output)
        view?.push(module: addRecordScreen, animated: true)
    }

    func showMessageModule(with message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: L10n.NFCAlert.Action.ok, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        view?.presentModule(alertController, animated: true, completion: nil)
    }

}
