//
//  ContactMessageScreenModuleOutput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import Contacts

protocol ContactMessageScreenModuleOutput: class {
    func recordContactAdded(contact: CNContact)
}
