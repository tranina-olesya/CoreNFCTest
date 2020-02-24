//
//  ReadTagScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

final class ReadTagScreenPresenter: ReadTagScreenModuleInput {

    // MARK: - Properties

    weak var view: ReadTagScreenViewInput?
    var router: ReadTagScreenRouterInput?
    var output: ReadTagScreenModuleOutput?

    // MARK: - Private Properties

    private let nfcReader: NFCReader

    // MARK: - Initialization

    init() {
        nfcReader = NFCReader()
        nfcReader.onRead = processMessages(messages:)
    }

}

// MARK: - ReadTagScreenViewOutput

extension ReadTagScreenPresenter: ReadTagScreenViewOutput {

    func startScan() {
        guard nfcReader.isReadingAvalible else {
            router?.showMessageModule(with: L10n.NFCAlert.Error.readingNotAvalible)
            return
        }
        nfcReader.beginSession()
    }

    func contactChosen(contactMessage: ContactMessage) {
        router?.openContactScreen(contact: contactMessage.contact)
    }

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func uriChosen(uriMessage: URIMessage) {
        router?.openURL(url: uriMessage.url)
    }

}

// MARK: - Help Methods

private extension ReadTagScreenPresenter {

    func processMessages(messages: [NDEFMessage]) {
        view?.updateMessages(messages: messages)
    }

}
