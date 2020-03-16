//
//  ReadTagScreenViewOutput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 16/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

protocol ReadTagScreenViewOutput {
    func viewDidLoad()
    func uriChosen(uriMessage: URIMessage)
    func contactChosen(contactMessage: ContactMessage)
    func startScan()
}
