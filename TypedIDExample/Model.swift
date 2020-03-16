//
//  Model.swift
//  TypedIDExample
//
//  Created by A431759 on 3/16/20.
//  Copyright © 2020 TLG. All rights reserved.
//

import Foundation

typealias DecodeModelsTuple = (StringModel?, TypedModel?)

struct StringModel: Codable {
    let id: String
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String else { return nil }
        self.id = id
    }
}

struct TypedModel: Codable {
    typealias ID = Identifier
    let id: ID

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? ID else { return nil }
        self.id = id
    }
}

func decodeModelsUsingCodable(data: Data) -> DecodeModelsTuple {
    let decoder = JSONDecoder()
    return DecodeModelsTuple(try? decoder.decode(StringModel.self, from: data),
                             try? decoder.decode(TypedModel.self, from: data))
}

func decodeModelsUsingDict(data: Data) -> DecodeModelsTuple {
    let dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    return DecodeModelsTuple(StringModel(dictionary: dict),
                             TypedModel(dictionary: dict))
}
