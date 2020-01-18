//
//  NDEFPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

class NDEFMessage {

    // MARK: - Properties

    let nfcType: NFCTypeNameFormat

    // MARK: - Initialization

    init(nfcType: NFCTypeNameFormat) {
        self.nfcType = nfcType
    }
}
