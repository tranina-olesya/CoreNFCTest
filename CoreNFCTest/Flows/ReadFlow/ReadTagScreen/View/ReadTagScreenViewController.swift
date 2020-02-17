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
    private lazy var adapter = NDEFRecordsAdapter(tableView: tableView)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - ReadTagScreenViewInput

extension ReadTagScreenViewController: ReadTagScreenViewInput {

    func setupInitialState() {
        title = L10n.MainTabBarScreen.ReadTab.title
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
        adapter.update(messages: messages)
    }

}

// MARK: - Configuration

private extension ReadTagScreenViewController {

    func configureNFCReader() {
        nfcReader.onRead = processMessages(messages:)
    }

    func configureScanButton() {
        scanButton.layer.cornerRadius = Constants.scanButtonCornerRadius
        scanButton.setTitle(L10n.ReadTagScreen.scanButtonTitle, for: .normal)
    }

}
