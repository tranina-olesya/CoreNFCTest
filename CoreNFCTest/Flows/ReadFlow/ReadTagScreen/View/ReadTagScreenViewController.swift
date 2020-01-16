//
//  ReadTagScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit
import CoreNFC

final class ReadTagScreenViewController: UIViewController, ModuleTransitionable {

    // MARK: - Properties

    var output: ReadTagScreenViewOutput?

    // MARK: - Private Properties

    let nfcReader = NFCReader()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        nfcReader.beginSession()
    }

}

// MARK: - ReadTagScreenViewInput

extension ReadTagScreenViewController: ReadTagScreenViewInput {

    func setupInitialState() {
        nfcReader.onRead = processMessages(messages:)
    }

}

private extension ReadTagScreenViewController {

    func processMessages(messages: [NDEFPayload]) {
        for message in messages {
            print(message)
            print(message)
        }
    }

}
