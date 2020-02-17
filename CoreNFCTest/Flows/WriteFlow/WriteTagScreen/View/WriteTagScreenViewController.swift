//
//  WriteTagScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit
import CoreNFC

final class WriteTagScreenViewController: UIViewController, WriteTagScreenViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: WriteTagScreenViewOutput?

    // MARK: - Private Properties

    private lazy var nfcWriter = NFCWriter(records: [])

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let textPayload = NFCNDEFPayload.wellKnownTypeTextPayload(
            string: "Brought to you by the Great Fish Company",
            locale: Locale(identifier: "En"))
        else {
            nfcWriter = NFCWriter(records: [])
            return
        }
        nfcWriter = NFCWriter(records: [textPayload])
        nfcWriter.beginSession()
    }

    // MARK: - WriteTagScreenViewInput

}
