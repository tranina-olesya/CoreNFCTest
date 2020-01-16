//
//  TextPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

final class TextPayload: NDEFPayload {

    let languageCode: String
    let text: String

    init(languageCode: String, text: String) {
        self.languageCode = languageCode
        self.text = text
        super.init(type: .text)
    }

}
