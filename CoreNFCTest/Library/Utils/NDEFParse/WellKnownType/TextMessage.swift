//
//  TextPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

final class TextMessage: WellKnownMessage {

    // MARK: - Properties

    var wellKnownType: WellKnownPayloadType {
        return .text
    }

    let languageCode: String
    let text: String

    // MARK: - Initialization

    init(languageCode: String, text: String) {
        self.languageCode = languageCode
        self.text = text
    }

}
