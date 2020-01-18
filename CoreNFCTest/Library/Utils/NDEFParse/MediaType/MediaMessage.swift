//
//  MediaMessage.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18.01.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

class MediaMessage: NDEFMessage {

    // MARK: - Properties

    let mediaType: MediaPayloadType

    // MARK: - Initialization

    init(mediaType: MediaPayloadType) {
        self.mediaType = mediaType
        super.init(nfcType: .media)
    }

}
