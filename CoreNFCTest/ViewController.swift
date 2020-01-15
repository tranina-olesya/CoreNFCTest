//
//  ViewController.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 13/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let nfcReader = NFCReader()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        nfcReader.beginSession()
    }

}

