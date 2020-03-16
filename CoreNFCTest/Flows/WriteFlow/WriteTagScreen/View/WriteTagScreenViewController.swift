//
//  WriteTagScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit
import CoreNFC

final class WriteTagScreenViewController: UIViewController, ModuleTransitionable {

    // MARK: - Constants

    private enum Constants {
        static let scanButtonCornerRadius: CGFloat = 10.0
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var writeButton: UIButton!

    // MARK: - Properties

    var output: WriteTagScreenViewOutput?

    // MARK: - Private Properties

    private lazy var adapter = NDEFRecordsAdapter(tableView: tableView)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - WriteTagScreenViewInput

extension WriteTagScreenViewController: WriteTagScreenViewInput {

    func updateMessages(_ messages: [NDEFMessage]) {
        adapter.update(messages: messages)
    }

    func setupInitialState() {
        configureNavigationBar()
        configureWriteButton()
    }

}

// MARK: - Configuration

private extension WriteTagScreenViewController {

    func configureNavigationBar() {
        title = L10n.MainTabBarScreen.WriteTab.title
        setRightNavigationBarItem(type: .add, selector: #selector(addRecordSelected))
        setLeftNavigationBarItem(title: L10n.WriteTagScreen.ClearButton.title, selector: #selector(clearRecordsSelected))
    }

    func configureWriteButton() {
        writeButton.layer.cornerRadius = Constants.scanButtonCornerRadius
        writeButton.setTitle(L10n.WriteTagScreen.writeButtonTitle, for: .normal)
    }

}

// MARK: - Actions

private extension WriteTagScreenViewController {

    @IBAction func writeButtonPressed(_ sender: Any) {
        output?.writeRecords()
    }

    @objc
    func addRecordSelected() {
        output?.addRecordSelected()
    }

    @objc
    func clearRecordsSelected() {
        output?.clearRecordsSelected()
    }

}
