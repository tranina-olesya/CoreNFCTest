//
//  MediaMessage.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18.01.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

protocol MediaMessage: NDEFMessage {
    var mediaType: MediaPayloadType { get }
}

extension MediaMessage {

    var nfcType: NFCTypeNameFormat {
        return .media
    }

}
