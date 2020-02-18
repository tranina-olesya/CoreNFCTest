//
//  ContactMessageScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import Contacts

final class ContactMessageScreenPresenter {

    // MARK: - Properties

    weak var view: ContactMessageScreenViewInput?
    var router: ContactMessageScreenRouterInput?
    var output: ContactMessageScreenModuleOutput?

}

// MARK: - ContactMessageScreenViewOutput

extension ContactMessageScreenPresenter: ContactMessageScreenViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func readySelected(name: String, phone: String, email: String) {
        let contact = CNMutableContact()
        contact.namePrefix = name
        let mainPhone = CNLabeledValue(label: CNLabelPhoneNumberMain, value: CNPhoneNumber(stringValue: phone))
        contact.phoneNumbers = [mainPhone]
        let emailAddress = CNLabeledValue(label: CNContactEmailAddressesKey, value: NSString(string: email))
        contact.emailAddresses = [emailAddress]

        output?.recordContactAdded(contact: contact)
        router?.popToInitial()
    }

}

// MARK: - ContactMessageScreenModuleInput

extension ContactMessageScreenPresenter: ContactMessageScreenModuleInput {

}
