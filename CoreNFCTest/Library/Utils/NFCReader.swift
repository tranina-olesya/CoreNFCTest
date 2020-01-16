//
//  NFCReader.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 15/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

final class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records {
                print("New Record Found:")
                print(NFCReader.formattedTypeNameFormat(from: record.typeNameFormat))
                print(record.payload)
                if let string = String(data: record.payload.advanced(by: 3), encoding: .utf8) {
                    print(" 1 " + string)
                }
                if let string = String(data: record.payload, encoding: .utf8) {
                    print(" 2 " + string)
                }
                if let string = String(data: record.type, encoding: .utf8) {
                    print(" 3 " + string)
                }

                print(record.identifier)
                print(record.type)

            }
        }
    }

    class func formattedTypeNameFormat(from typeNameFormat: NFCTypeNameFormat) -> String {
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

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFC NDEF Invalidated")
        print("\(error)")
    }

    func beginSession() {
        let session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: false)
        session.alertMessage = "Hold your iPhone near the item to learn more about it."
        session.begin()
    }

}
