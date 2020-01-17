//
//  NDEFPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

class NDEFPayloadMessage {

    // MARK: - Properties

    let type: PayloadType

    // MARK: - Initialization

    init(type: PayloadType) {
        self.type = type
    }
}
