//
//  Stripe Billing Subscription Schedule Types Billing Subscription Schedule.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.SubscriptionSchedule {
    // https://docs.stripe.com/api/subscription_schedules/create.md
    public enum Create {}
}

extension Stripe.Billing.SubscriptionSchedule.Create {
    public struct Request: Codable, Equatable, Sendable {
        /// The identifier of the customer to create the subscription schedule for
        public var customer: Stripe.Customers.Customer.ID?
        /// Migrate an existing subscription to be managed by a subscription schedule
        public var fromSubscription: Stripe.Billing.Subscription.ID?
        /// When the subscription schedule starts
        public var startDate: StartDate?
        /// Behavior when the subscription schedule ends
        public var endBehavior: EndBehavior?
        /// Object containing service periods
        public var phases: [Phase]?
        /// Default settings for subscription schedule
        public var defaultSettings: DefaultSettings?
        /// Set of key-value pairs
        public var metadata: [String: String]?
        
        public init(
            customer: Stripe.Customers.Customer.ID? = nil,
            fromSubscription: Stripe.Billing.Subscription.ID? = nil,
            startDate: StartDate? = nil,
            endBehavior: EndBehavior? = nil,
            phases: [Phase]? = nil,
            defaultSettings: DefaultSettings? = nil,
            metadata: [String: String]? = nil
        ) {
            self.customer = customer
            self.fromSubscription = fromSubscription
            self.startDate = startDate
            self.endBehavior = endBehavior
            self.phases = phases
            self.defaultSettings = defaultSettings
            self.metadata = metadata
        }
        
        private enum CodingKeys: String, CodingKey {
            case customer
            case fromSubscription = "from_subscription"
            case startDate = "start_date"
            case endBehavior = "end_behavior"
            case phases
            case defaultSettings = "default_settings"
            case metadata
        }
    }
    
    public enum StartDate: Codable, Equatable, Sendable {
        case now
        case timestamp(Int)
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .now:
                try container.encode("now")
            case .timestamp(let value):
                try container.encode(value)
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let string = try? container.decode(String.self), string == "now" {
                self = .now
            } else if let timestamp = try? container.decode(Int.self) {
                self = .timestamp(timestamp)
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid StartDate value")
            }
        }
    }
    
    public enum EndBehavior: String, Codable, Equatable, Sendable {
        case release
        case cancel
    }
    
    public struct Phase: Codable, Equatable, Sendable {
        /// List of configuration items
        public var items: [Item]
        /// How long the phase lasts
        public var iterations: Int?
        /// The end of this phase
        public var endDate: Int?
        /// Whether this phase is a trial
        public var trial: Bool?
        /// Default tax rates to apply
        public var defaultTaxRates: [String]?
        /// Discounts to apply
        public var discounts: [Discount]?
        /// Billing cycle anchor configuration
        public var billingCycleAnchor: BillingCycleAnchor?
        /// Collection method for this phase
        public var collectionMethod: CollectionMethod?
        /// Invoice settings for this phase
        public var invoiceSettings: InvoiceSettings?
        /// Subscription data to set on the subscription
        public var metadata: [String: String]?
        
        public init(
            items: [Item],
            iterations: Int? = nil,
            endDate: Int? = nil,
            trial: Bool? = nil,
            defaultTaxRates: [String]? = nil,
            discounts: [Discount]? = nil,
            billingCycleAnchor: BillingCycleAnchor? = nil,
            collectionMethod: CollectionMethod? = nil,
            invoiceSettings: InvoiceSettings? = nil,
            metadata: [String: String]? = nil
        ) {
            self.items = items
            self.iterations = iterations
            self.endDate = endDate
            self.trial = trial
            self.defaultTaxRates = defaultTaxRates
            self.discounts = discounts
            self.billingCycleAnchor = billingCycleAnchor
            self.collectionMethod = collectionMethod
            self.invoiceSettings = invoiceSettings
            self.metadata = metadata
        }
        
        private enum CodingKeys: String, CodingKey {
            case items
            case iterations
            case endDate = "end_date"
            case trial
            case defaultTaxRates = "default_tax_rates"
            case discounts
            case billingCycleAnchor = "billing_cycle_anchor"
            case collectionMethod = "collection_method"
            case invoiceSettings = "invoice_settings"
            case metadata
        }
    }
    
    public struct Item: Codable, Equatable, Sendable {
        /// The price ID
        public var price: Stripe.Products.Price.ID?
        /// Inline price data
        public var priceData: PriceData?
        /// Quantity for this item
        public var quantity: Int?
        /// Tax rates to apply
        public var taxRates: [String]?
        /// Billing thresholds for this item
        public var billingThresholds: BillingThresholds?
        
        public init(
            price: Stripe.Products.Price.ID? = nil,
            priceData: PriceData? = nil,
            quantity: Int? = nil,
            taxRates: [String]? = nil,
            billingThresholds: BillingThresholds? = nil
        ) {
            self.price = price
            self.priceData = priceData
            self.quantity = quantity
            self.taxRates = taxRates
            self.billingThresholds = billingThresholds
        }
        
        private enum CodingKeys: String, CodingKey {
            case price
            case priceData = "price_data"
            case quantity
            case taxRates = "tax_rates"
            case billingThresholds = "billing_thresholds"
        }
    }
    
    public struct PriceData: Codable, Equatable, Sendable {
        /// Three-letter ISO currency code
        public var currency: Stripe.Currency
        /// The ID of the product
        public var product: Stripe.Products.Product.ID
        /// The recurring components of a price
        public var recurring: Recurring
        /// Unit amount
        public var unitAmount: Int?
        /// Unit amount as a decimal string
        public var unitAmountDecimal: String?
        
        public init(
            currency: Stripe.Currency,
            product: Stripe.Products.Product.ID,
            recurring: Recurring,
            unitAmount: Int? = nil,
            unitAmountDecimal: String? = nil
        ) {
            self.currency = currency
            self.product = product
            self.recurring = recurring
            self.unitAmount = unitAmount
            self.unitAmountDecimal = unitAmountDecimal
        }
        
        private enum CodingKeys: String, CodingKey {
            case currency
            case product
            case recurring
            case unitAmount = "unit_amount"
            case unitAmountDecimal = "unit_amount_decimal"
        }
    }
    
    public struct Recurring: Codable, Equatable, Sendable {
        /// Billing frequency
        public var interval: String
        /// Number of intervals
        public var intervalCount: Int?
        
        public init(
            interval: String,
            intervalCount: Int? = nil
        ) {
            self.interval = interval
            self.intervalCount = intervalCount
        }
        
        private enum CodingKeys: String, CodingKey {
            case interval
            case intervalCount = "interval_count"
        }
    }
    
    public struct BillingThresholds: Codable, Equatable, Sendable {
        /// Usage threshold
        public var usageGte: Int?
        
        public init(usageGte: Int? = nil) {
            self.usageGte = usageGte
        }
        
        private enum CodingKeys: String, CodingKey {
            case usageGte = "usage_gte"
        }
    }
    
    public struct Discount: Codable, Equatable, Sendable {
        /// ID of an existing discount
        public var coupon: String?
        /// ID of an existing promotion code
        public var promotionCode: Promotion.Code.ID?
        
        public init(
            coupon: String? = nil,
            promotionCode: Promotion.Code.ID? = nil
        ) {
            self.coupon = coupon
            self.promotionCode = promotionCode
        }
        
        private enum CodingKeys: String, CodingKey {
            case coupon
            case promotionCode = "promotion_code"
        }
    }
    
    public enum BillingCycleAnchor: String, Codable, Equatable, Sendable {
        case automatic
        case phaseStart = "phase_start"
    }
    
    public enum CollectionMethod: String, Codable, Equatable, Sendable {
        case chargeAutomatically = "charge_automatically"
        case sendInvoice = "send_invoice"
    }
    
    public struct InvoiceSettings: Codable, Equatable, Sendable {
        /// Number of days within which a customer must pay invoices
        public var daysUntilDue: Int?
        
        public init(daysUntilDue: Int? = nil) {
            self.daysUntilDue = daysUntilDue
        }
        
        private enum CodingKeys: String, CodingKey {
            case daysUntilDue = "days_until_due"
        }
    }
    
    public struct DefaultSettings: Codable, Equatable, Sendable {
        /// Default payment method for subscription invoices
        public var defaultPaymentMethod: Stripe.PaymentMethods.PaymentMethod.ID?
        /// Subscription description
        public var description: String?
        /// Footer for invoices
        public var invoiceSettings: InvoiceSettings?
        
        public init(
            defaultPaymentMethod: Stripe.PaymentMethods.PaymentMethod.ID? = nil,
            description: String? = nil,
            invoiceSettings: InvoiceSettings? = nil
        ) {
            self.defaultPaymentMethod = defaultPaymentMethod
            self.description = description
            self.invoiceSettings = invoiceSettings
        }
        
        private enum CodingKeys: String, CodingKey {
            case defaultPaymentMethod = "default_payment_method"
            case description
            case invoiceSettings = "invoice_settings"
        }
    }
}

extension Stripe.Billing.SubscriptionSchedule {
    // https://docs.stripe.com/api/subscription_schedules/update.md
    public enum Update {}
}

extension Stripe.Billing.SubscriptionSchedule.Update {
    public struct Request: Codable, Equatable, Sendable {
        /// Behavior when the subscription schedule ends
        public var endBehavior: Stripe.Billing.SubscriptionSchedule.Create.EndBehavior?
        /// Object containing service periods
        public var phases: [Stripe.Billing.SubscriptionSchedule.Create.Phase]?
        /// Default settings for subscription schedule
        public var defaultSettings: Stripe.Billing.SubscriptionSchedule.Create.DefaultSettings?
        /// Set of key-value pairs
        public var metadata: [String: String]?
        /// Determines how to handle prorations
        public var prorationBehavior: ProrationBehavior?
        
        public init(
            endBehavior: Stripe.Billing.SubscriptionSchedule.Create.EndBehavior? = nil,
            phases: [Stripe.Billing.SubscriptionSchedule.Create.Phase]? = nil,
            defaultSettings: Stripe.Billing.SubscriptionSchedule.Create.DefaultSettings? = nil,
            metadata: [String: String]? = nil,
            prorationBehavior: ProrationBehavior? = nil
        ) {
            self.endBehavior = endBehavior
            self.phases = phases
            self.defaultSettings = defaultSettings
            self.metadata = metadata
            self.prorationBehavior = prorationBehavior
        }
        
        private enum CodingKeys: String, CodingKey {
            case endBehavior = "end_behavior"
            case phases
            case defaultSettings = "default_settings"
            case metadata
            case prorationBehavior = "proration_behavior"
        }
    }
    
    public enum ProrationBehavior: String, Codable, Equatable, Sendable {
        case createProrations = "create_prorations"
        case none
        case alwaysInvoice = "always_invoice"
    }
}

extension Stripe.Billing.SubscriptionSchedule {
    // https://docs.stripe.com/api/subscription_schedules/list.md
    public enum List {}
}

extension Stripe.Billing.SubscriptionSchedule.List {
    public struct Request: Codable, Equatable, Sendable {
        /// Filter by cancellation date
        public var canceledAt: Stripe.DateFilter?
        /// Filter by completion date
        public var completedAt: Stripe.DateFilter?
        /// Filter by creation date
        public var created: Stripe.DateFilter?
        /// Filter by customer
        public var customer: Stripe.Customers.Customer.ID?
        /// Pagination cursor
        public var endingBefore: String?
        /// Number of objects to return
        public var limit: Int?
        /// Filter by release date
        public var releasedAt: Stripe.DateFilter?
        /// Filter for not-yet-started schedules
        public var scheduled: Bool?
        /// Pagination cursor
        public var startingAfter: String?
        
        public init(
            canceledAt: Stripe.DateFilter? = nil,
            completedAt: Stripe.DateFilter? = nil,
            created: Stripe.DateFilter? = nil,
            customer: Stripe.Customers.Customer.ID? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            releasedAt: Stripe.DateFilter? = nil,
            scheduled: Bool? = nil,
            startingAfter: String? = nil
        ) {
            self.canceledAt = canceledAt
            self.completedAt = completedAt
            self.created = created
            self.customer = customer
            self.endingBefore = endingBefore
            self.limit = limit
            self.releasedAt = releasedAt
            self.scheduled = scheduled
            self.startingAfter = startingAfter
        }
        
        private enum CodingKeys: String, CodingKey {
            case canceledAt = "canceled_at"
            case completedAt = "completed_at"
            case created
            case customer
            case endingBefore = "ending_before"
            case limit
            case releasedAt = "released_at"
            case scheduled
            case startingAfter = "starting_after"
        }
    }
    
    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Billing.SubscriptionSchedule.Model]
        
        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}

extension Stripe.Billing.SubscriptionSchedule {
    // https://docs.stripe.com/api/subscription_schedules/cancel.md
    public enum Cancel {}
}

extension Stripe.Billing.SubscriptionSchedule.Cancel {
    public struct Request: Codable, Equatable, Sendable {
        /// If the subscription schedule is active
        public var invoiceNow: Bool?
        /// If the subscription schedule is active, determines how to handle prorations
        public var prorate: Bool?
        
        public init(
            invoiceNow: Bool? = nil,
            prorate: Bool? = nil
        ) {
            self.invoiceNow = invoiceNow
            self.prorate = prorate
        }
        
        private enum CodingKeys: String, CodingKey {
            case invoiceNow = "invoice_now"
            case prorate
        }
    }
}

extension Stripe.Billing.SubscriptionSchedule {
    // https://docs.stripe.com/api/subscription_schedules/release.md
    public enum Release {}
}

extension Stripe.Billing.SubscriptionSchedule.Release {
    public struct Request: Codable, Equatable, Sendable {
        /// Keep any cancellation on the subscription
        public var preserveCancelDate: Bool?
        
        public init(preserveCancelDate: Bool? = nil) {
            self.preserveCancelDate = preserveCancelDate
        }
        
        private enum CodingKeys: String, CodingKey {
            case preserveCancelDate = "preserve_cancel_date"
        }
    }
}
