//
//  WriteTagScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import CoreNFC

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
        guard nfcWriter.isReadingAvalible else {
            router?.showMessageModule(with: L10n.NFCAlert.Error.readingNotAvalible)
            return
        }

        nfcWriter.beginSession()
    }

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func addRecordSelected() {
        router?.showAddRecordScreen(output: self)
    }

    func clearRecordsSelected() {
        messages = []
        view?.updateMessages(messages)
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
                    let payload = NDEFPayloadUtils.formWellKnownPayload(message: wellKnownMessage)
                else {
                    return
                }
                records.append(payload)
            case .media:
                guard
                    let mediaMessage = message as? MediaMessage,
                    let payload = NDEFPayloadUtils.formMediaPayload(message: mediaMessage)
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

}
