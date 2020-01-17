//
//  NFCReader.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 15/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC
import UIKit

typealias MessagesClosure = ([NDEFPayloadMessage]) -> Void

final class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {

    var onRead: MessagesClosure?

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var ndefMessages = [NDEFPayloadMessage]()
        for message in messages {
            for record in message.records {
                switch record.typeNameFormat {
                case .media:
                    guard let message = NDEFParser.parseMediaMessage(record: record) else {
                        continue
                    }
                    ndefMessages.append(message)
                case .nfcWellKnown:
                    guard let message = NDEFParser.parseWellKnownMessage(record: record) else {
                        continue
                    }
                    ndefMessages.append(message)
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
