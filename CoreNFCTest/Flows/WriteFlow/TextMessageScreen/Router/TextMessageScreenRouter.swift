//
//  TextMessageScreenRouter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class TextMessageScreenRouter {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

}

// MARK: - TextMessageScreenRouterInput

extension TextMessageScreenRouter: TextMessageScreenRouterInput {

    func popToInitial() {
        view?.popToRoot(animated: true)
    }

}
