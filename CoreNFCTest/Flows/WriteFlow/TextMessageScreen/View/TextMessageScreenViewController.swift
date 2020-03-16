//
//  TextMessageScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class TextMessageScreenViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!

    // MARK: - Properties

    var output: TextMessageScreenViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - TextMessageScreenViewInput

extension TextMessageScreenViewController: TextMessageScreenViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureLabels()
    }

}

// MARK: - Configuration

private extension TextMessageScreenViewController {

    func configureNavigationBar() {
        setRightNavigationBarItem(title: L10n.NavigationBar.ready, selector: #selector(readySelected))
    }

    func configureLabels() {
        textLabel.text = L10n.TextMessageScreen.TextLabel.title
    }

}

// MARK: - Actions

private extension TextMessageScreenViewController {

    @objc
    func readySelected() {
        output?.readySelected(text: textView.text)
    }

}
