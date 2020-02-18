//
//  NDEFType.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17.02.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

enum NDEFWriteType: CaseIterable {

    case uri
    case text
    case contact

    // MARK: - Properties

    var title: String {
        switch self {
        case .uri:
            return "u"
        case .contact:
            return "c"
        case .text:
            return "t"
        }
    }

}
