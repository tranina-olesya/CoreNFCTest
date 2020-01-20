//
//  ReadTagScreenRouter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import ContactsUI

final class ReadTagScreenRouter: ReadTagScreenRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - ReadTagScreenRouterInput

    func openContactScreen(contact: CNContact) {
        let contactViewController = CNContactViewController(for: contact)
        view?.push(module: contactViewController, animated: true)
    }

    func openURL(url: URL) {
        UIApplication.shared.open(url)
    }

}
