//
//  URLMessageScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class URLMessageScreenViewController: UIViewController, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var typeTextField: UITextField!
    @IBOutlet private weak var urlTextField: UITextField!

    // MARK: - Properties

    var output: URLMessageScreenViewOutput?

    // MARK: - Private Properties

    private let itemPicker = UIPickerView()
    private let uriTypes = URIType.allCases

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - URLMessageInputViewInput

extension URLMessageScreenViewController: URLMessageScreenViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureTypeTextField()
        configureLabels()
    }

}

// MARK: - UIPickerViewDelegate & UIPickerViewDataSource

extension URLMessageScreenViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uriTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uriTypes[row].rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeTextField.text = uriTypes[row].rawValue
    }

}

// MARK: - Configuration

private extension URLMessageScreenViewController {

    func configureNavigationBar() {
        setRightNavigationBarItem(title: L10n.NavigationBar.ready, selector: #selector(readySelected))
    }

    func configureTypeTextField() {
        itemPicker.delegate = self
        itemPicker.dataSource = self
        typeTextField.inputView = itemPicker
    }

    func configureLabels() {
        typeLabel.text = L10n.URLMessageScreen.TypeLabel.title
        urlLabel.text = L10n.URLMessageScreen.UrlLabel.title
    }

}

// MARK: - Actions

private extension URLMessageScreenViewController {

    @objc
    func readySelected() {
        guard
            let type = URIType(rawValue: typeTextField?.text ?? ""),
            type != .unknown,
            let urlText = urlTextField.text
        else {
            return
        }
        output?.readySelected(type: type, urlText: urlText)
    }

}
