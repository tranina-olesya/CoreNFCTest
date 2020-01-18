//
//  ContactMessage.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 17/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Contacts

final class ContactMessage: MediaMessage {

    let contact: CNContact

    init(contact: CNContact) {
        self.contact = contact
        super.init(mediaType: .contact)
    }

}
