//
//  URIPrefixType.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

enum URIType {

    case unknown
    case httpWWW
    case httpsWWW
    case http
    case https
    case tel
    case mailto

    var stringPrefix: String {
        switch self {
        case .unknown:
            return ""
        case .httpWWW:
            return "http://www."
        case .httpsWWW:
            return "https://www."
        case .http:
            return "http://"
        case .https:
            return "https://"
        case .tel:
            return "tel:"
        case .mailto:
            return "mailto:"
        }
    }

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
