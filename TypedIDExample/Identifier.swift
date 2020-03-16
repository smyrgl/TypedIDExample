//
//  Identifier.swift
//  TypedIDExample
//
//  Created by A431759 on 3/16/20.
//  Copyright © 2020 TLG. All rights reserved.
//

import Foundation

struct Identifier: Hashable {
    let string: String

    var isEmpty: Bool { string.isEmpty }

    func hash(into hasher: inout Hasher) {
        hasher.combine(string)
    }
}

extension Identifier: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        string = value
    }
}

extension Identifier: CustomStringConvertible {
    var description: String {
        string
    }
}

extension Identifier: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        string = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
