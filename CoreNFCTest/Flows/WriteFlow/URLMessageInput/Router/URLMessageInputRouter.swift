//
//  URLMessageInputRouter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class URLMessageInputRouter {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - URLMessageInputRouterInput

}

extension URLMessageInputRouter: URLMessageInputRouterInput {

    func popToInitial() {
        view?.popToRoot(animated: true)
    }

}
