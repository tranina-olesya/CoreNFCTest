//
//  ContactMessageScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class ContactMessageScreenViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!

    // MARK: - Properties

    var output: ContactMessageScreenViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - ContactMessageInputViewInput

extension ContactMessageScreenViewController: ContactMessageScreenViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureLabels()
    }

}

// MARK: - Configuration

private extension ContactMessageScreenViewController {

    func configureNavigationBar() {
        setRightNavigationBarItem(title: L10n.NavigationBar.ready, selector: #selector(readySelected))
    }

    func configureLabels() {
        nameLabel.text = L10n.ContactMessageScreen.NameLabel.title
        phoneLabel.text = L10n.ContactMessageScreen.PhoneLabel.title
        emailLabel.text = L10n.ContactMessageScreen.EmailLabel.title
    }

}

// MARK: - Actions

private extension ContactMessageScreenViewController {

    @objc
    func readySelected() {
        guard
            let name = nameLabel.text,
            let phone = phoneLabel.text,
            let email = emailLabel.text
        else {
            return
        }
        output?.readySelected(name: name, phone: phone, email: email)
    }

}
