//
//  WriteTagScreenViewInput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

protocol WriteTagScreenViewInput: class {
    func setupInitialState()
    func updateMessages(_ messages: [NDEFMessage])
}
