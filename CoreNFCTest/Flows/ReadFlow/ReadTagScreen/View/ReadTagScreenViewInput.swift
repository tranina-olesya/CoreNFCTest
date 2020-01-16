//
//  ReadTagScreenViewInput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

protocol ReadTagScreenViewInput: class {
    func setupInitialState()
    func openURL(url: URL)
}
