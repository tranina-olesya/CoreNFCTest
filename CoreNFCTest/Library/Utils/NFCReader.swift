//
//  NFCReader.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 15/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC
import UIKit

typealias MessagesClosure = ([NDEFPayload]) -> Void

final class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {

    var onRead: MessagesClosure?

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var ndefMessages = [NDEFPayload]()
        for message in messages {
            for record in message.records {
                guard let rawValue = String(data: record.type, encoding: .utf8) else {
                    return
                }
                switch PayloadType(rawValue: rawValue) {
                case .uri:
                    guard let urlPayloadMessage = NDEFParser.parseUriPayload(payload: record.payload) else {
                        return
                    }
                    ndefMessages.append(urlPayloadMessage)
                case .text:
                    guard let textPayloadMessage = NDEFParser.parseTextPayload(payload: record.payload) else {
                        return
                    }
                    ndefMessages.append(textPayloadMessage)
                case .smartPoster:
                    continue
                default:
                    continue
                }
            }
        }
        onRead?(ndefMessages)
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFC NDEF Invalidated")
        print("\(error)")
    }

    func beginSession() {
        let session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: true)
        session.alertMessage = L10n.nfcAlertMessage
        session.begin()
    }

}
