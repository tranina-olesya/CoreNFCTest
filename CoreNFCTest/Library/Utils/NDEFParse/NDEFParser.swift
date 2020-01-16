//
//  NDEFParser.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

enum NDEFParser {

    static func parseUriPayload(payload: Data) -> URIPayload? {
        let prefix = URIType.from(prefix: payload.prefix(1))
        let rawPayload = payload.dropFirst(1)

        guard let payload = String(data: rawPayload, encoding: .utf8),
            let url = URL(string: "\(prefix.stringPrefix)\(payload)") else {
            return nil
        }

        return URIPayload(uriType: prefix, url: url)
    }

    static func parseTextPayload(payload: Data) -> TextPayload? {
        let languagePayload = payload.subdata(in: Range(1...2))
        let textPayload = payload.advanced(by: 3)

        guard let language = String(data: languagePayload, encoding: .utf8),
            let text = String(data: textPayload, encoding: .utf8) else {
                return nil
        }

        return TextPayload(languageCode: language, text: text)
    }

    static func formattedTypeNameFormat(from typeNameFormat: NFCTypeNameFormat) -> String {
        switch typeNameFormat {
        case .empty:
            return "Empty"
        case .nfcWellKnown:
            return "NFC Well Known"
        case .media:
            return "Media"
        case .absoluteURI:
            return "Absolute URI"
        case .nfcExternal:
            return "NFC External"
        case .unchanged:
            return "Unchanged"
        default:
            return "Unknown"
        }
    }

}
