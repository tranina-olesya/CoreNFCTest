//
//  NFCReader.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 15/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

typealias MessagesClosure = ([NDEFMessage]) -> Void

final class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {

    // MARK: - Properties

    var onRead: MessagesClosure?

    var isReadingAvalible: Bool {
        return NFCNDEFReaderSession.readingAvailable
    }

    // MARK: - NFCNDEFReaderSessionDelegate

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var ndefMessages = [NDEFMessage]()
        messages.forEach {
            $0.records.forEach {
                if let ndefMessage = NDEFParser.parseNDEFMessage($0) {
                    ndefMessages.append(ndefMessage)
                }
            }
        }
        onRead?(ndefMessages)
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("\(error)")
    }
    
    // MARK: - Methods

    func beginSession() {
        let session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: true)
        session.alertMessage = L10n.NFCAlert.message
        session.begin()
    }

}
