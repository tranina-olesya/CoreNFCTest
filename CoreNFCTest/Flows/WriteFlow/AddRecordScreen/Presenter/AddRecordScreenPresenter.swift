//
//  AddRecordPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import Contacts

final class AddRecordScreenPresenter: AddRecordScreenModuleInput {

    // MARK: - Properties

    weak var view: AddRecordScreenViewInput?
    var router: AddRecordScreenRouterInput?
    var output: AddRecordScreenModuleOutput?

}

// MARK: - AddRecordModuleInput

extension AddRecordScreenPresenter: AddRecordScreenViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func typeSelected(type: NDEFWriteType) {
        switch type {
        case .contact:
            router?.showAddContact(output: self)
        case .text:
            router?.showAddText(output: self)
        case .uri:
            router?.showAddURLMessage(output: self)
        }
    }

}

// MARK: - URLMessageInputModuleOutput

extension AddRecordScreenPresenter: URLMessageScreenModuleOutput {

    func recordURLAdded(type: URIType, url: URL) {
        let uriMessage = URIMessage(uriType: type, url: url)
        output?.recordAdded(record: uriMessage)
    }

}

// MARK: - ContactMessageInputModuleOutput

extension AddRecordScreenPresenter: ContactMessageScreenModuleOutput {

    func recordContactAdded(contact: CNContact) {
        let contactMessage = ContactMessage(contact: contact)
        output?.recordAdded(record: contactMessage)
    }

}

// MARK: - TextMessageScreenModuleOutput

extension AddRecordScreenPresenter: TextMessageScreenModuleOutput {

    func recordTextAdded(text: String) {
        let textMessage = TextMessage(languageCode: "en", text: text)
        output?.recordAdded(record: textMessage)
    }

}
