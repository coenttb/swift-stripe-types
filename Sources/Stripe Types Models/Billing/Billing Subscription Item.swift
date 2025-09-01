//
//  Subscription.Item.swift
//  Stripe
//
//  Created by Andrew Edwards on 6/6/17.
//
//

import Foundation
import Stripe_Types_Shared

// https://docs.stripe.com/api/subscription_items/object.md

extension Stripe.Billing.Subscription {
    /// The [Subscription Item Object](https://stripe.com/docs/api/subscription_items/object) .
    public struct Item: Codable, Hashable, Sendable, Identifiable {
        public typealias ID = Tagged<Self, String>
        /// Unique identifier for the object.
        public var id: ID
        /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
        public var metadata: [String: String]?
        /// The price the customer is subscribed to.
        public var price: Stripe.Products.Price?
        /// The quantity of the plan to which the customer should be subscribed.
        public var quantity: Int?
        /// The `subscription` this `subscription_item` belongs to.
        public var subscription: Stripe.Billing.Subscription.ID?
        /// String representing the object’s type. Objects of the same type share the same value.
        public var object: String
        /// Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
        public var billingThresholds: BillingThresholds?
        /// Time at which the object was created. Measured in seconds since the Unix epoch.
        public var created: Date
        /// The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`.
        public var taxRates: [Stripe.Tax.Rate]?
        /// Current period end for this subscription item
        public var currentPeriodEnd: Date?
        /// Current period start for this subscription item
        public var currentPeriodStart: Date?
        /// Legacy plan object (deprecated, use price instead)
        public var plan: Stripe.Billing.Plan?
        /// Array of discounts applied to this subscription item
        public var discounts: [Stripe.Products.Discount]?

        enum CodingKeys: String, CodingKey, CaseIterable {
            case id
            case metadata
            case price
            case quantity
            case subscription
            case object
            case billingThresholds = "billing_thresholds"
            case created
            case taxRates = "tax_rates"
            case currentPeriodEnd = "current_period_end"
            case currentPeriodStart = "current_period_start"
            case plan
            case discounts
        }

        public init(
            id: ID,
            metadata: [String: String]? = nil,
            price: Stripe.Products.Price? = nil,
            quantity: Int? = nil,
            subscription: Stripe.Billing.Subscription.ID? = nil,
            object: String,
            billingThresholds: BillingThresholds? = nil,
            created: Date,
            taxRates: [Stripe.Tax.Rate]? = nil,
            currentPeriodEnd: Date? = nil,
            currentPeriodStart: Date? = nil,
            plan: Stripe.Billing.Plan? = nil,
            discounts: [Stripe.Products.Discount]? = nil
        ) {
            self.id = id
            self.metadata = metadata
            self.price = price
            self.quantity = quantity
            self.subscription = subscription
            self.object = object
            self.billingThresholds = billingThresholds
            self.created = created
            self.taxRates = taxRates
            self.currentPeriodEnd = currentPeriodEnd
            self.currentPeriodStart = currentPeriodStart
            self.plan = plan
            self.discounts = discounts
        }
    }
}

extension Stripe.Billing.Subscription.Item {
    public struct BillingThresholds: Codable, Hashable, Sendable {
        /// Usage threshold that triggers the subscription to create an invoice
        public var usageGte: Int?

        public init(
            usageGte: Int? = nil
        ) {
            self.usageGte = usageGte
        }
    }
}

extension Stripe.Billing.Subscription.Item {
    public enum PaymentBehavior: String, Codable, Sendable {
        /// Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid.
        case allowIncomplete = "allow_incomplete"
        /// Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription’s first invoice cannot be paid.
        case errorIfIncomplete = "error_if_incomplete"
        /// Use `pending_if_incomplete` to update the subscription using pending updates. When you use `pending_if_incomplete` you can only pass the parameters supported by pending updates.
        case pendingIfIncomplete = "pending_if_incomplete"
        /// Use `default_incomplete` to transition the subscription to `status=past_due` when payment is required and await explicit confirmation of the invoice’s payment intent. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, SCA regulation, or collecting a mandate for a bank debit payment method.
        case defaultIncomplete = "default_incomplete"

    }
}

extension Stripe.Billing.Subscription.Item {
    public enum ProrationBehavior: String, Codable, Sendable {
        case createProrations = "create_prorations"
        case alwaysInvoice = "always_invoice"
        case none
    }
}

extension Stripe.Billing.Subscription.Item {
    public struct List: Codable, Hashable, Sendable {
        public var object: String
        public var hasMore: Bool?
        public var url: String?
        public var data: [Stripe.Billing.Subscription.Item]?
        public var totalCount: Int?

        private enum CodingKeys: String, CodingKey {
            case object
            case hasMore = "has_more"
            case url
            case data
            case totalCount = "total_count"
        }

        public init(
            object: String,
            hasMore: Bool? = nil,
            url: String? = nil,
            data: [Stripe.Billing.Subscription.Item]? = nil,
            totalCount: Int? = nil
        ) {
            self.object = object
            self.hasMore = hasMore
            self.url = url
            self.data = data
            self.totalCount = totalCount
        }
    }
}
