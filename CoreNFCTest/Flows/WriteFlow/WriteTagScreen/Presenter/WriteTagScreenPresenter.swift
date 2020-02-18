//
//  WriteTagScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import CoreNFC
import Contacts

final class WriteTagScreenPresenter: WriteTagScreenModuleInput {

    // MARK: - Properties

    weak var view: WriteTagScreenViewInput?
    var router: WriteTagScreenRouterInput?
    var output: WriteTagScreenModuleOutput?

    private var messages: [NDEFMessage] = []
    private var nfcWriter: NFCWriter = NFCWriter(records: [])

}

// MARK: - WriteTagScreenViewOutput

extension WriteTagScreenPresenter: WriteTagScreenViewOutput {

    func writeRecords() {
        nfcWriter = NFCWriter(records: formRecordsForWrite())
        nfcWriter.beginSession()
    }

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func addRecordSelected() {
        router?.showAddRecordScreen(output: self)
    }

}

// MARK: - AddRecordModuleOutput

extension WriteTagScreenPresenter: AddRecordScreenModuleOutput {

    func recordAdded(record: NDEFMessage) {
        messages.append(record)
        view?.updateMessages(messages)
    }

}

// MARK: - Help Methods

private extension WriteTagScreenPresenter {

    func formRecordsForWrite() -> [NFCNDEFPayload] {
        var records = [NFCNDEFPayload]()

        messages.forEach { message in
            switch message.nfcType {
            case .nfcWellKnown:
                guard
                    let wellKnownMessage = message as? WellKnownMessage,
                    let payload = formWellKnownPayload(message: wellKnownMessage)
                else {
                    return
                }
                records.append(payload)
            case .media:
                guard
                    let mediaMessage = message as? MediaMessage,
                    let payload = formMediaPayload(message: mediaMessage)
                else {
                    return
                }
                records.append(payload)
            default:
                break
            }
        }

        return records
    }

    func formWellKnownPayload(message: WellKnownMessage) -> NFCNDEFPayload? {
        switch message.wellKnownType {
        case .text:
            guard let textMessage = message as? TextMessage else {
                return nil
            }
            return NFCNDEFPayload.wellKnownTypeTextPayload(
                string: textMessage.text,
                locale: Locale(identifier: textMessage.languageCode)
            )
        case .uri:
            guard
                let uriMessage = message as? URIMessage,
                let url = URL(string: uriMessage.uriType.rawValue + uriMessage.url.absoluteString)
            else {
                return nil
            }
            return NFCNDEFPayload.wellKnownTypeURIPayload(url: url)
        default:
            return nil
        }
    }

    func formMediaPayload(message: MediaMessage) -> NFCNDEFPayload? {
        switch message.mediaType {
        case .contact:
            guard
                let contactMessage = message as? ContactMessage,
                let payload = try? CNContactVCardSerialization.data(with: [contactMessage.contact])
            else {
                return nil
            }
            return NFCNDEFPayload(format: .media, type: Data(MediaPayloadType.contact.rawValue.utf8), identifier: Data(), payload: payload)
        default:
            return nil
        }
    }

}
