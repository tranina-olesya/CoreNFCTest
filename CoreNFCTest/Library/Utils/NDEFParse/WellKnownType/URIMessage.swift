//
//  URLPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

final class URIMessage: WellKnownMessage {

    // MARK: - Properties

    var wellKnownType: WellKnownPayloadType {
        return .uri
    }

    let uriType: URIType
    let url: URL

    // MARK: - Initialization

    init(uriType: URIType, url: URL) {
        self.uriType = uriType
        self.url = url
    }

}
