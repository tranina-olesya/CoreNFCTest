//
//  WellKnownMessage.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18.01.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

protocol WellKnownMessage: NDEFMessage {
    var wellKnownType: WellKnownPayloadType { get }
}

extension WellKnownMessage {

    var nfcType: NFCTypeNameFormat {
        return .nfcWellKnown
    }

}
