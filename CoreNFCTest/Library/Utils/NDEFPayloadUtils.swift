//
//  NDEFPayloadUtils.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 23.02.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC
import Contacts

enum NDEFPayloadUtils {

    static func formWellKnownPayload(message: WellKnownMessage) -> NFCNDEFPayload? {
        switch message.wellKnownType {
        case .text:
            guard let textMessage = message as? TextMessage else {
                return nil
            }
            return NFCNDEFPayload.wellKnownTypeTextPayload(
                string: textMessage.text,
                locale: Locale(identifier: textMessage.languageCode)
            )
        case .uri:
            guard
                let uriMessage = message as? URIMessage,
                let url = URL(string: uriMessage.uriType.rawValue + uriMessage.url.absoluteString)
            else {
                return nil
            }
            return NFCNDEFPayload.wellKnownTypeURIPayload(url: url)
        default:
            return nil
        }
    }

    static func formMediaPayload(message: MediaMessage) -> NFCNDEFPayload? {
        switch message.mediaType {
        case .contact:
            guard
                let contactMessage = message as? ContactMessage,
                let payload = try? CNContactVCardSerialization.data(with: [contactMessage.contact])
            else {
                return nil
            }
            return NFCNDEFPayload(format: .media, type: Data(MediaPayloadType.contact.rawValue.utf8), identifier: Data(), payload: payload)
        default:
            return nil
        }
    }

}
