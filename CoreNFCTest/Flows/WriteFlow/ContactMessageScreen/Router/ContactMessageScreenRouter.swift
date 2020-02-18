//
//  ContactMessageScreenRouter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class ContactMessageScreenRouter {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

}

// MARK: - ContactMessageInputRouterInput

extension ContactMessageScreenRouter: ContactMessageScreenRouterInput {

    func popToInitial() {
        view?.popToRoot(animated: true)
    }

}
