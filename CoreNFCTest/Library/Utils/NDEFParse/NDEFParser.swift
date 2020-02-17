//
//  NDEFParser.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Contacts
import CoreNFC
import NetworkExtension

enum NDEFParser {

    static func parseNDEFMessage(_ record: NFCNDEFPayload) -> NDEFMessage? {
        switch record.typeNameFormat {
        case .media:
            return parseMediaMessage(record: record)
        case .nfcWellKnown:
            return parseWellKnownMessage(record: record)
        default:
            return nil
        }
    }

}

// MARK: - Media Messages

private extension NDEFParser {

    static func parseMediaMessage(record: NFCNDEFPayload) -> NDEFMessage? {
        guard let rawValue = String(data: record.type, encoding: .utf8) else {
            return nil
        }
        switch MediaPayloadType(rawValue: rawValue) {
        case .contact:
            guard let contactPayloadMessage = parseContact(payload: record.payload) else {
                return nil
            }
            return contactPayloadMessage
        default:
            return nil
        }
    }

    static func parseContact(payload: Data) -> ContactMessage? {
        guard let contacts = try? CNContactVCardSerialization.contacts(with: payload),
            let contact = contacts.first else {
            return nil
        }
        return ContactMessage(contact: contact)
    }

}

// MARK: - Well Known Messages

private extension NDEFParser {

    static func parseWellKnownMessage(record: NFCNDEFPayload) -> NDEFMessage? {
        guard let rawValue = String(data: record.type, encoding: .utf8) else {
            return nil
        }
        switch WellKnownPayloadType(rawValue: rawValue) {
        case .uri:
            guard let urlPayloadMessage = parseURIMessage(payload: record.payload) else {
                return nil
            }
            return urlPayloadMessage
        case .text:
            guard let textPayloadMessage = parseTextMessage(payload: record.payload) else {
                return nil
            }
            return textPayloadMessage
        case .smartPoster:
            return nil
        default:
            return nil
        }
    }

    static func parseURIMessage(payload: Data) -> URIMessage? {
        let prefix = URIType.from(prefix: payload.prefix(1))
        let rawPayload = payload.dropFirst(1)

        guard var payload = String(data: rawPayload, encoding: .utf8) else {
            return nil
        }
        payload = payload.replacingOccurrences(of: "geo:", with: "maps:")

        guard let url = URL(string: "\(prefix.stringPrefix)\(payload)") else {
            return nil
        }

        return URIMessage(uriType: prefix, url: url)
    }

    static func parseTextMessage(payload: Data) -> TextMessage? {
        let languagePayload = payload.subdata(in: Range(1...2))
        let textPayload = payload.advanced(by: 3)

        guard
            let encoding = getEncodingType(payload.prefix(1)),
            let language = String(data: languagePayload, encoding: .utf8),
            let text = String(data: textPayload, encoding: encoding)
        else {
                return nil
        }

        return TextMessage(languageCode: language, text: text)
    }

    static func getEncodingType(_ data: Data) -> String.Encoding? {
        guard ![UInt8](data).isEmpty else {
            return nil
        }
        let encodingData = [UInt8](data)[0] & 0x80
        let isUTF16 = encodingData != 0
        return isUTF16 ? .utf16 : .utf8
    }

}
