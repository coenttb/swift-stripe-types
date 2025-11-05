//
//  PaymentSource.swift
//  Stripe
//
//  Created by Nicolas Bachschmidt on 2018-08-09.
//

import Stripe_Types_Shared

/**
 Payment Source objects
 https://stripe.com/docs/api#customer_bank_account_object
 https://stripe.com/docs/api#card_object
 https://stripe.com/docs/api#source_object
 */

public enum StripePaymentSource: Codable, Hashable, Sendable {
    case bankAccount(BankAccount)
    case card(Card)
    case source(Source)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let object = try container.decode(String.self, forKey: .object)
        switch object {
        case "bank_account":
            self = try .bankAccount(BankAccount(from: decoder))
        case "card":
            self = try .card(Card(from: decoder))
        case "source":
            self = try .source(Source(from: decoder))
        default:
            throw DecodingError.dataCorruptedError(
                forKey: CodingKeys.object,
                in: container,
                debugDescription: "Unknown payment source \"\(object)\""
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .bankAccount(let bankAccount):
            try bankAccount.encode(to: encoder)
        case .card(let card):
            try card.encode(to: encoder)
        case .source(let source):
            try source.encode(to: encoder)
        }
    }

    public enum CodingKeys: String, CodingKey {
        case object
    }
}

extension StripePaymentSource {
    public var bankAccount: BankAccount? {
        guard case .bankAccount(let bankAccount) = self else {
            return nil
        }
        return bankAccount
    }

    public var card: Card? {
        guard case .card(let card) = self else {
            return nil
        }
        return card
    }

    public var source: Source? {
        guard case .source(let source) = self else {
            return nil
        }
        return source
    }
    public typealias ID = Tagged<Self, String>
    public var id: ID {
        switch self {
        case .bankAccount(let bankAccount):
            return .init(bankAccount.id.rawValue)
        case .card(let card):
            return .init(card.id.rawValue)
        case .source(let source):
            return .init(source.id.rawValue)
        }
    }

    public var object: String {
        switch self {
        case .bankAccount(let bankAccount):
            return bankAccount.object
        case .card(let card):
            return card.object
        case .source(let source):
            return source.object
        }
    }
}
