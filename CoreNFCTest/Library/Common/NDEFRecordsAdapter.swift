//
//  NDEFRecordsAdapter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17.02.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import ReactiveDataDisplayManager

final class NDEFRecordsAdapter {

    // MARK: - Internal Properties

    var contactChosen: ((ContactMessage) -> Void)?
    var uriChosen: ((URIMessage) -> Void)?

    // MARK: - Private Properties

    private let ddm: BaseTableDataDisplayManager

    // MARK: - Initialization

    init(tableView: UITableView) {
        ddm = BaseTableDataDisplayManager(collection: tableView)
    }

    // MARK: - Internal Methods

    func update(messages: [NDEFMessage]) {
        fillAdapter(messages: messages)
    }

}

// MARK: - Private Methods

private extension NDEFRecordsAdapter {

    func fillAdapter(messages: [NDEFMessage]) {
        ddm.clearCellGenerators()

        for message in messages {
            switch message.nfcType {
            case .media:
                configureMediaMessageCell(message: message)
            case .nfcWellKnown:
                configureWellKnownMessageCell(message: message)
            default:
                break
            }
        }

        ddm.forceRefill()
    }

    func configureMediaMessageCell(message: NDEFMessage) {
        guard let message = message as? MediaMessage else {
            return
        }
        switch message.mediaType {
        case .wifi:
            break
        case .contact:
            guard let contactMessage = message as? ContactMessage else {
                return
            }
            let contactMessageGenerator = BaseCellGenerator<ContactMessageCell>(with: contactMessage)
            contactMessageGenerator.didSelectEvent += { [weak self] in
                self?.contactChosen?(contactMessage)
            }
            ddm.addCellGenerator(contactMessageGenerator)
        }
    }

    func configureWellKnownMessageCell(message: NDEFMessage) {
        guard let message = message as? WellKnownMessage else {
            return
        }
        switch message.wellKnownType {
        case .smartPoster:
            break
        case .text:
            guard let textMessage = message as? TextMessage else {
                return
            }
            let textMessageGenerator = BaseCellGenerator<TextMessageCell>(with: textMessage)
            ddm.addCellGenerator(textMessageGenerator)
        case .uri:
            guard let uriMessage = message as? URIMessage else {
                return
            }
            let uriMessageGenerator = BaseCellGenerator<URIMessageCell>(with: uriMessage)
            uriMessageGenerator.didSelectEvent += { [weak self] in
                self?.uriChosen?(uriMessage)
            }
            ddm.addCellGenerator(uriMessageGenerator)
        }
    }

}
