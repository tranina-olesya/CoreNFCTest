//
//  ContactMessage.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 17/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Contacts

final class ContactMessage: MediaMessage {

    // MARK: - Properties

    var mediaType: MediaPayloadType {
        return .contact
    }

    let contact: CNContact

    // MARK: - Initialization

    init(contact: CNContact) {
        self.contact = contact
    }

}
