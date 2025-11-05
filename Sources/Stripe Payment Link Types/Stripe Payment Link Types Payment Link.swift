//
//  File.swift
//  swift-stripe
//
//  Created by Coen ten Thije Boonkkamp on 09/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.PaymentLinks {
    // https://docs.stripe.com/api/payment-link/create.md
    public enum Create {}
    // https://docs.stripe.com/api/payment-link/update.md
    public enum Update {}
    // https://docs.stripe.com/api/payment-link/list.md
    public enum List {}
    // https://docs.stripe.com/api/payment-link/retrieve-line-items.md
    public enum LineItems {}
}

// https://docs.stripe.com/api/payment-link/list.md
extension Stripe.PaymentLinks.List {
    public struct Request: Codable, Equatable, Sendable {
        public let active: Bool?
        public let endingBefore: String?
        public let limit: Int?
        public let startingAfter: String?

        private enum CodingKeys: String, CodingKey {
            case active
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }

        public init(
            active: Bool? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.active = active
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }
    }
}

// https://docs.stripe.com/api/payment-link/list.md
extension Stripe.PaymentLinks.List {
    public struct Response: Codable, Equatable, Sendable {
        public let object: String?
        public let url: String?
        public let hasMore: Bool?
        public let data: [Stripe.PaymentLink]?

        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}

// https://docs.stripe.com/api/payment-link/retrieve-line-items.md
extension Stripe.PaymentLinks.LineItems {
    public struct Request: Codable, Equatable, Sendable {
        public let endingBefore: String?
        public let startingAfter: String?
        public let limit: Int?

        private enum CodingKeys: String, CodingKey {
            case endingBefore = "ending_before"
            case startingAfter = "starting_after"
            case limit
        }

        public init(
            endingBefore: String? = nil,
            startingAfter: String? = nil,
            limit: Int? = nil
        ) {
            self.endingBefore = endingBefore
            self.startingAfter = startingAfter
            self.limit = limit
        }
    }
}

// https://docs.stripe.com/api/payment-link/retrieve-line-items.md
extension Stripe.PaymentLinks.LineItems {
    public struct Response: Codable, Equatable, Sendable {
        public let object: String?
        public let url: String?
        public let hasMore: Bool?
        public let data: [Stripe.PaymentLink.LineItem]?

        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}
