//
//  PayloadType.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import Foundation

/// Тип данных, который может находиться в Well-Known записи
enum WellKnownPayloadType: String {
    case text = "T"
    case uri = "U"
    case smartPoster = "Sp"
}
