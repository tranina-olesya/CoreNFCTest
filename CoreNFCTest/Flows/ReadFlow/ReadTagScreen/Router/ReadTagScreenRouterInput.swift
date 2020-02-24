//
//  ReadTagScreenRouterInput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import Contacts

protocol ReadTagScreenRouterInput {
    func openContactScreen(contact: CNContact)
    func openURL(url: URL)
    func showMessageModule(with message: String)
}
