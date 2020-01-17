//
//  NDEFParser.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Contacts

enum NDEFParser {

    static func parseUriPayload(payload: Data) -> URIMessage? {
        let prefix = URIType.from(prefix: payload.prefix(1))
        let rawPayload = payload.dropFirst(1)

        guard var payload = String(data: rawPayload, encoding: .utf8) else {
            return nil
        }
        payload = payload.replacingOccurrences(of: "geo", with: "maps")

        guard let url = URL(string: "\(prefix.stringPrefix)\(payload)") else {
            return nil
        }

        return URIMessage(uriType: prefix, url: url)
    }

    static func parseTextPayload(payload: Data) -> TextMessage? {
        let languagePayload = payload.subdata(in: Range(1...2))
        let textPayload = payload.advanced(by: 3)

        guard let language = String(data: languagePayload, encoding: .utf8),
            let text = String(data: textPayload, encoding: .utf8) else {
                return nil
        }

        return TextMessage(languageCode: language, text: text)
    }

    static func parseContact(payload: Data) -> ContactMessage? {
        guard let contacts = try? CNContactVCardSerialization.contacts(with: payload),
            let contact = contacts.first else {
            return nil
        }
        return ContactMessage(contact: contact)
    }

}
