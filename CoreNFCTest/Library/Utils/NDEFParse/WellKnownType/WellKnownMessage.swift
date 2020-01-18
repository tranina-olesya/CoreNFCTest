//
//  WellKnownMessage.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18.01.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

class WellKnownMessage: NDEFMessage {

    // MARK: - Properties

    let wellKnownType: WellKnownPayloadType

    // MARK: - Initialization

    init(wellKnownType: WellKnownPayloadType) {
        self.wellKnownType = wellKnownType
        super.init(nfcType: .nfcWellKnown)
    }

}
