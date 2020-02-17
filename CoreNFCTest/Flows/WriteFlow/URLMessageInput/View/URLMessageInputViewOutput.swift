//
//  URLMessageInputViewOutput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

protocol URLMessageInputViewOutput {
    func viewDidLoad()
    func readySelected(type: URIType, urlText: String)
}
