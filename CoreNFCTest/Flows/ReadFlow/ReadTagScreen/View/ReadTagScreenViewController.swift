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
        nfcReader.onRead = processMessages(messages:)
        configureScanButton()
    }

    func openURL(url: URL) {
        UIApplication.shared.open(url)
    }

}

// MARK: - Actions

private extension ReadTagScreenViewController {

    @IBAction func scanButtonPressed(_ sender: Any) {
        nfcReader.beginSession()
    }

    func processMessages(messages: [NDEFPayloadMessage]) {
        fillAdapter(messages: messages)
    }

}

// MARK: - Adapter

private extension ReadTagScreenViewController {

    func fillAdapter(messages: [NDEFPayloadMessage]) {
        adapter.clearCellGenerators()

        for message in messages {
            switch message.type {
            case .text:
                configureTextMessageCell(message: message)
            case .uri:
                configureURIMessageCell(message: message)
            case .contact:
                configureContactMessageCell(message: message)
            default:
                continue
            }
        }

        adapter.forceRefill()
    }

    func configureTextMessageCell(message: NDEFPayloadMessage) {
        guard let textMessage = message as? TextMessage else {
            return
        }
        let generator = BaseCellGenerator<TextMessageCell>(with: textMessage)
        adapter.addCellGenerator(generator)
    }

    func configureURIMessageCell(message: NDEFPayloadMessage) {
        guard let uriMessage = message as? URIMessage else {
            return
        }
        let generator = BaseCellGenerator<URIMessageCell>(with: uriMessage)
        generator.didSelectEvent += { [weak self] in
            self?.output?.uriChosen(uriMessage: uriMessage)
        }
        adapter.addCellGenerator(generator)
    }

    func configureContactMessageCell(message: NDEFPayloadMessage) {
        guard let contactMessage = message as? ContactMessage else {
            return
        }
        let generator = BaseCellGenerator<ContactMessageCell>(with: contactMessage)
        generator.didSelectEvent += { [weak self] in
            self?.output?.contactChosen(contactMessage: contactMessage)
        }
        adapter.addCellGenerator(generator)

    }

}

// MARK: - Configure

private extension ReadTagScreenViewController {

    func configureScanButton() {
        scanButton.layer.cornerRadius = Constants.scanButtonCornerRadius
        scanButton.setTitle(L10n.ReadTagScreen.scanButtonTitle, for: .normal)
    }

}
