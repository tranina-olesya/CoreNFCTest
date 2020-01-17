//
//  NDEFPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

class NDEFPayloadMessage {

    // MARK: - Properties

    let nfcType: NFCTypeNameFormat

    // MARK: - Initialization

    init(nfcType: NFCTypeNameFormat) {
        self.nfcType = nfcType
    }
}

class MediaMessage: NDEFPayloadMessage {

    // MARK: - Properties

    let mediaType: MediaPayloadType

    // MARK: - Initialization

    init(mediaType: MediaPayloadType) {
        self.mediaType = mediaType
        super.init(nfcType: .media)
    }

}

class WellKnownMessage: NDEFPayloadMessage {

    // MARK: - Properties

    let wellKnownType: WellKnownPayloadType

    // MARK: - Initialization

    init(wellKnownType: WellKnownPayloadType) {
        self.wellKnownType = wellKnownType
        super.init(nfcType: .nfcWellKnown)
    }

}
