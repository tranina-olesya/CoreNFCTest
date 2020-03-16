//
//  ContactMessageScreenViewOutput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

protocol ContactMessageScreenViewOutput {
    func viewDidLoad()
    func readySelected(name: String, phone: String, email: String)
}
