//
//  WellKnownMessage.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18.01.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

/// Сообщение, сождержащее Well-Known запись
protocol WellKnownMessage: NDEFMessage {

    /// Тип данных в сообщении
    var wellKnownType: WellKnownPayloadType { get }

}

extension WellKnownMessage {

    var nfcType: NFCTypeNameFormat {
        return .nfcWellKnown
    }

}
