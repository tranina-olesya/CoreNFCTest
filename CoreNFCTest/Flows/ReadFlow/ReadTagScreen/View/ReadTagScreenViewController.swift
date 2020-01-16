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

    func processMessages(messages: [NDEFPayload]) {
        fillAdapter(messages: messages)
    }

}

// MARK: - Adapter

private extension ReadTagScreenViewController {

    func fillAdapter(messages: [NDEFPayload]) {
        adapter.clearCellGenerators()

        for message in messages {
            switch message.type {
            case .text:
                guard let textPayload = message as? TextPayload else {
                    continue
                }
                let generator = BaseCellGenerator<TextMessageCell>(with: textPayload)
                adapter.addCellGenerator(generator)
            case .uri:
                guard let uriPayload = message as? URIPayload else {
                    continue
                }
                let generator = BaseCellGenerator<URIMessageCell>(with: uriPayload)
                generator.didSelectEvent += { [weak self] in
                    self?.output?.uriChosen(uriPayload: uriPayload)
                }
                adapter.addCellGenerator(generator)
            default:
                continue
            }
        }

        adapter.forceRefill()
    }

}

// MARK: - Configure

private extension ReadTagScreenViewController {

    func configureScanButton() {
        scanButton.layer.cornerRadius = Constants.scanButtonCornerRadius
        scanButton.setTitle(L10n.ReadTagScreen.scanButtonTitle, for: .normal)
    }

}
