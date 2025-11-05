//
//  DeletedObject.swift
//  Stripe
//
//  Created by Anthony Castelli on 4/20/17.
//
//

import Stripe_Types_Shared

public struct DeletedObject<Object>: Codable, Hashable, Sendable {
    public var id: Tagged<Object, String>
    public var object: String
    public var deleted: Bool

    public init(
        id: Tagged<Object, String>,
        object: String,
        deleted: Bool
    ) {
        self.id = id
        self.object = object
        self.deleted = deleted
    }
}
