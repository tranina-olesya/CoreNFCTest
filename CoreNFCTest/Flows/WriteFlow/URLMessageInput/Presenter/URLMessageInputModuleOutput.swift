//
//  URLMessageInputModuleOutput.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import Foundation

protocol URLMessageInputModuleOutput: class {
    func recordURLAdded(type: URIType, url: URL)
}
