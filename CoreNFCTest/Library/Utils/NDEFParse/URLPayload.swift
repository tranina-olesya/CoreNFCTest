//
//  URLPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

final class URLPayload: NDEFPayload {

    let uriType: URIType
    let url: URL

    init(uriType: URIType, url: URL) {
        self.uriType = uriType
        self.url = url
        super.init(type: .uri)
    }

}
