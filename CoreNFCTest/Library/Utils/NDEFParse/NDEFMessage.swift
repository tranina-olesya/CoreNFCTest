//
//  NDEFPayload.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreNFC

protocol NDEFMessage {

    /// Тип сообщения, записанного на метке
    var nfcType: NFCTypeNameFormat { get }

}
