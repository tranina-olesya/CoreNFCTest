//
//  MediaPayloadType.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 17/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

/// Тип данных, который может находиться в Media записи
enum MediaPayloadType: String {
    case contact = "text/vcard"
    case wifi = "application/vnd.wfa.wsc"
}
