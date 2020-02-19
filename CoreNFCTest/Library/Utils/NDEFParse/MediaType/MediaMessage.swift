//
//  MediaMessage.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18.01.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

/// Сообщение, сождержащее Media запись
protocol MediaMessage: NDEFMessage {

    /// Тип данных в сообщении
    var mediaType: MediaPayloadType { get }

}

extension MediaMessage {

    var nfcType: NFCTypeNameFormat {
        return .media
    }

}
