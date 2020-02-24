//
//  NFCWriter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17.02.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

final class NFCWriter: NSObject, NFCNDEFReaderSessionDelegate {

    // MARK: - Properties

    var ndefMessage: NFCNDEFMessage

    var isReadingAvalible: Bool {
        return NFCNDEFReaderSession.readingAvailable
    }

    // MARK: - Initialization

    init(records: [NFCNDEFPayload]) {
        ndefMessage = NFCNDEFMessage(records: records)
    }

    // MARK: - NFCNDEFReaderSessionDelegate

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        guard
            tags.count == 1,
            let tag = tags.first
        else {
            session.alertMessage = L10n.NFCWriter.Error.tooManyTags
            return
        }

        session.connect(to: tag) { (error) in
            guard error == nil else {
                session.restartPolling()
                return
            }

            tag.queryNDEFStatus { [weak self] (status, capacity, error) in
                guard let self = self else {
                    return
                }

                guard error == nil else {
                    session.invalidate(errorMessage: L10n.NFCWriter.Error.failedDetermineNDEFStatus)
                    return
                }

                switch status {
                case .readOnly:
                    session.invalidate(errorMessage: L10n.NFCWriter.Error.notWritable)
                case .notSupported:
                    session.invalidate(errorMessage: L10n.NFCWriter.Error.notSupported)
                case .readWrite:
                    guard self.ndefMessage.length < capacity else {
                        session.invalidate(errorMessage: L10n.NFCWriter.Error.smallCapacity(String(self.ndefMessage.length)))
                        return
                    }

                    tag.writeNDEF(self.ndefMessage) { (error) in
                        guard error == nil else {
                            session.invalidate(errorMessage: L10n.NFCWriter.Error.failedWrite)
                            return
                        }
                        session.alertMessage = L10n.NFCWriter.successMessage
                        session.invalidate()
                    }
                @unknown default:
                    break
                }
            }
        }
    }

    // MARK: - Methods

    func beginSession() {
        let session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: true)
        session.alertMessage = L10n.NFCAlert.message
        session.begin()
    }

}
