//
//  URIPrefixType.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

/// Тип протокола, который должен быть добавлен к URI записи
enum URIType: String, CaseIterable {

    case unknown = ""
    case httpWWW = "http://www."
    case httpsWWW = "https://www."
    case http = "http://"
    case https = "https://"
    case tel = "tel:"
    case mailto = "mailto:"

    // MARK: - Internal Methods

    static func from(prefix: Data) -> URIType {
        switch prefix {
        case Data([0x00]):
            return .unknown
        case Data([0x01]):
            return .httpWWW
        case Data([0x02]):
            return .httpsWWW
        case Data([0x03]):
            return .http
        case Data([0x04]):
            return .https
        case Data([0x05]):
            return .tel
        case Data([0x06]):
            return .mailto
        default:
            return .unknown
        }
    }

}
