//
//  Identifier.swift
//  TypedIDExample
//
//  Created by A431759 on 3/16/20.
//  Copyright © 2020 TLG. All rights reserved.
//

import Foundation

struct Identifier {
    let rawValue: String
}

extension Identifier: RawRepresentable {
    typealias RawValue = String
}

extension Identifier: Hashable {}

extension Identifier: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        rawValue = value
    }
}

extension Identifier: CustomStringConvertible {
    var description: String {
        rawValue
    }
}

extension Identifier: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
