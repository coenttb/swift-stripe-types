//
//  File.swift
//  swift-stripe
//
//  Created by Coen ten Thije Boonkkamp on 07/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

// Main request/response types
extension Stripe.Products.Coupons {
    public enum Create {}
    public enum Update {}
    public enum List {}
}

extension Stripe.Products.Coupons.Create {
    public struct Request: Codable, Equatable, Sendable {
        public let amountOff: Int?
        public let currency: Stripe.Currency?
        public let duration: Stripe.Products.Coupon.Duration
        public let durationInMonths: Int?
        public let metadata: [String: String]?
        public let name: String?
        public let percentOff: Double?
        public let appliesTo: Stripe.Products.Coupon.AppliesTo?
        public let currencyOptions: [Stripe.Currency: Stripe.Products.Coupon.Currency.Options]?
        public let id: String?
        public let maxRedemptions: Int?
        public let redeemBy: Date?

        private enum CodingKeys: String, CodingKey {
            case amountOff = "amount_off"
            case currency
            case duration
            case durationInMonths = "duration_in_months"
            case metadata
            case name
            case percentOff = "percent_off"
            case appliesTo = "applies_to"
            case currencyOptions = "currency_options"
            case id
            case maxRedemptions = "max_redemptions"
            case redeemBy = "redeem_by"
        }

        public init(
            amountOff: Int? = nil,
            currency: Stripe.Currency? = nil,
            duration: Stripe.Products.Coupon.Duration,
            durationInMonths: Int? = nil,
            metadata: [String: String]? = nil,
            name: String? = nil,
            percentOff: Double? = nil,
            appliesTo: Stripe.Products.Coupon.AppliesTo? = nil,
            currencyOptions: [Stripe.Currency: Stripe.Products.Coupon.Currency.Options]? = nil,
            id: String? = nil,
            maxRedemptions: Int? = nil,
            redeemBy: Date? = nil
        ) {
            self.amountOff = amountOff
            self.currency = currency
            self.duration = duration
            self.durationInMonths = durationInMonths
            self.metadata = metadata
            self.name = name
            self.percentOff = percentOff
            self.appliesTo = appliesTo
            self.currencyOptions = currencyOptions
            self.id = id
            self.maxRedemptions = maxRedemptions
            self.redeemBy = redeemBy
        }
    }
}

extension Stripe.Products.Coupons.Update {
    public struct Request: Codable, Equatable, Sendable {
        public let metadata: [String: String]?
        public let name: String?
        public let currencyOptions: [Stripe.Currency: Stripe.Products.Coupon.Currency.Options]?

        private enum CodingKeys: String, CodingKey {
            case metadata
            case name
            case currencyOptions = "currency_options"
        }

        public init(
            metadata: [String: String]? = nil,
            name: String? = nil,
            currencyOptions: [Stripe.Currency: Stripe.Products.Coupon.Currency.Options]? = nil
        ) {
            self.metadata = metadata
            self.name = name
            self.currencyOptions = currencyOptions
        }
    }
}

extension Stripe.Products.Coupons.List {
    public struct Request: Codable, Equatable, Sendable {
        public let created: Stripe.DateFilter?
        public let endingBefore: String?
        public let limit: Int?
        public let startingAfter: String?

        private enum CodingKeys: String, CodingKey {
            case created
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }

        public init(
            created: Stripe.DateFilter? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.created = created
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }
    }

    public struct Response: Codable, Equatable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Products.Coupon]

        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}
