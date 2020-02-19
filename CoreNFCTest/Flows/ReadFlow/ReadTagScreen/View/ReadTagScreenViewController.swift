//
//  ReadTagScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class ReadTagScreenViewController: UIViewController, ModuleTransitionable {

    // MARK: - Constants

    private enum Constants {
        static let scanButtonCornerRadius: CGFloat = 10.0
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var scanButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: ReadTagScreenViewOutput?

    // MARK: - Private Properties

    private lazy var nfcReader = NFCReader()
    private lazy var adapter = BaseTableDataDisplayManager(collection: tableView)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - ReadTagScreenViewInput

extension ReadTagScreenViewController: ReadTagScreenViewInput {

    func setupInitialState() {
        configureNFCReader()
        configureScanButton()
    }

}

// MARK: - Actions

private extension ReadTagScreenViewController {

    @IBAction func scanButtonPressed(_ sender: Any) {
        nfcReader.beginSession()
    }

    func processMessages(messages: [NDEFMessage]) {
        fillAdapter(messages: messages)
    }

}

// MARK: - Adapter

private extension ReadTagScreenViewController {

    func fillAdapter(messages: [NDEFMessage]) {
        adapter.clearCellGenerators()

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

        adapter.forceRefill()
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
                self?.output?.contactChosen(contactMessage: contactMessage)
            }
            adapter.addCellGenerator(contactMessageGenerator)
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
            adapter.addCellGenerator(textMessageGenerator)
        case .uri:
            guard let uriMessage = message as? URIMessage else {
                return
            }
            let uriMessageGenerator = BaseCellGenerator<URIMessageCell>(with: uriMessage)
            uriMessageGenerator.didSelectEvent += { [weak self] in
                self?.output?.uriChosen(uriMessage: uriMessage)
            }
            adapter.addCellGenerator(uriMessageGenerator)
        }
    }

}

// MARK: - Configure

private extension ReadTagScreenViewController {

    func configureNFCReader() {
        nfcReader.onRead = processMessages(messages:)
    }

    func configureScanButton() {
        scanButton.layer.cornerRadius = Constants.scanButtonCornerRadius
        scanButton.setTitle(L10n.ReadTagScreen.scanButtonTitle, for: .normal)
    }

}
