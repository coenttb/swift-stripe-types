//
//  Stripe Billing Quotes Types Billing Quotes.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Quotes {
    // Placeholder for the Quote model - should be replaced with actual model from Stripe Types Models
    public struct Quote: Codable, Equatable, Sendable, Identifiable {
        public typealias ID = Tagged<Self, String>
        public let id: ID
        public let object: String
        public let created: Date
        public let expiresAt: Date?
        public let status: Status?
        
        private enum CodingKeys: String, CodingKey {
            case id
            case object
            case created
            case expiresAt = "expires_at"
            case status
        }
    }
    
    public enum Status: String, Codable, Equatable, Sendable {
        case draft
        case open
        case sent
        case accepted
        case canceled
        case finalizing
    }
    
    public struct AutomaticTax: Codable, Equatable, Sendable {
        public var enabled: Bool
        public var liability: Liability?
        
        public init(enabled: Bool, liability: Liability? = nil) {
            self.enabled = enabled
            self.liability = liability
        }
        
        public struct Liability: Codable, Equatable, Sendable {
            public var type: String?
            public var account: String?
            
            public init(type: String? = nil, account: String? = nil) {
                self.type = type
                self.account = account
            }
        }
    }
    
    public struct TransferData: Codable, Equatable, Sendable {
        public var destination: String
        public var amount: Int?
        public var amountPercent: Decimal?
        
        public init(destination: String, amount: Int? = nil, amountPercent: Decimal? = nil) {
            self.destination = destination
            self.amount = amount
            self.amountPercent = amountPercent
        }
        
        private enum CodingKeys: String, CodingKey {
            case destination
            case amount
            case amountPercent = "amount_percent"
        }
    }
    
    public struct Discount: Codable, Equatable, Sendable {
        public var coupon: String?
        public var discount: String?
        public var promotionCode: Promotion.Code.ID?
        
        public init(coupon: String? = nil, discount: String? = nil, promotionCode: Promotion.Code.ID? = nil) {
            self.coupon = coupon
            self.discount = discount
            self.promotionCode = promotionCode
        }
        
        private enum CodingKeys: String, CodingKey {
            case coupon
            case discount
            case promotionCode = "promotion_code"
        }
    }
    
    public struct LineItem: Codable, Equatable, Sendable {
        public var price: Stripe.Products.Price.ID?
        public var priceData: PriceData?
        public var quantity: Int?
        public var taxRates: [String]?
        
        public init(
            price: Stripe.Products.Price.ID? = nil,
            priceData: PriceData? = nil,
            quantity: Int? = nil,
            taxRates: [String]? = nil
        ) {
            self.price = price
            self.priceData = priceData
            self.quantity = quantity
            self.taxRates = taxRates
        }
        
        private enum CodingKeys: String, CodingKey {
            case price
            case priceData = "price_data"
            case quantity
            case taxRates = "tax_rates"
        }
    }
    
    public struct PriceData: Codable, Equatable, Sendable {
        public var currency: Stripe.Currency
        public var product: Stripe.Products.Product.ID
        public var unitAmount: Int?
        public var unitAmountDecimal: String?
        public var recurring: Recurring?
        public var taxBehavior: String?
        
        public init(
            currency: Stripe.Currency,
            product: Stripe.Products.Product.ID,
            unitAmount: Int? = nil,
            unitAmountDecimal: String? = nil,
            recurring: Recurring? = nil,
            taxBehavior: String? = nil
        ) {
            self.currency = currency
            self.product = product
            self.unitAmount = unitAmount
            self.unitAmountDecimal = unitAmountDecimal
            self.recurring = recurring
            self.taxBehavior = taxBehavior
        }
        
        private enum CodingKeys: String, CodingKey {
            case currency
            case product
            case unitAmount = "unit_amount"
            case unitAmountDecimal = "unit_amount_decimal"
            case recurring
            case taxBehavior = "tax_behavior"
        }
    }
    
    public struct Recurring: Codable, Equatable, Sendable {
        public var interval: String
        public var intervalCount: Int?
        
        public init(interval: String, intervalCount: Int? = nil) {
            self.interval = interval
            self.intervalCount = intervalCount
        }
        
        private enum CodingKeys: String, CodingKey {
            case interval
            case intervalCount = "interval_count"
        }
    }
}

extension Stripe.Billing.Quotes {
    // https://docs.stripe.com/api/quotes/create.md
    public enum Create {}
}

extension Stripe.Billing.Quotes.Create {
    public struct Request: Codable, Equatable, Sendable {
        public var customer: Stripe.Customers.Customer.ID?
        public var lineItems: [Stripe.Billing.Quotes.LineItem]?
        public var metadata: [String: String]?
        public var description: String?
        public var footer: String?
        public var expiresAt: Date?
        public var header: String?
        public var subscriptionData: SubscriptionData?
        public var collectionMethod: CollectionMethod?
        public var automaticTax: Stripe.Billing.Quotes.AutomaticTax?
        public var transferData: Stripe.Billing.Quotes.TransferData?
        public var onBehalfOf: String?
        public var fromQuote: FromQuote?
        public var testClock: String?
        public var invoiceSettings: InvoiceSettings?
        public var discounts: [Stripe.Billing.Quotes.Discount]?
        public var defaultTaxRates: [String]?
        
        public init(
            customer: Stripe.Customers.Customer.ID? = nil,
            lineItems: [Stripe.Billing.Quotes.LineItem]? = nil,
            metadata: [String: String]? = nil,
            description: String? = nil,
            footer: String? = nil,
            expiresAt: Date? = nil,
            header: String? = nil,
            subscriptionData: SubscriptionData? = nil,
            collectionMethod: CollectionMethod? = nil,
            automaticTax: Stripe.Billing.Quotes.AutomaticTax? = nil,
            transferData: Stripe.Billing.Quotes.TransferData? = nil,
            onBehalfOf: String? = nil,
            fromQuote: FromQuote? = nil,
            testClock: String? = nil,
            invoiceSettings: InvoiceSettings? = nil,
            discounts: [Stripe.Billing.Quotes.Discount]? = nil,
            defaultTaxRates: [String]? = nil
        ) {
            self.customer = customer
            self.lineItems = lineItems
            self.metadata = metadata
            self.description = description
            self.footer = footer
            self.expiresAt = expiresAt
            self.header = header
            self.subscriptionData = subscriptionData
            self.collectionMethod = collectionMethod
            self.automaticTax = automaticTax
            self.transferData = transferData
            self.onBehalfOf = onBehalfOf
            self.fromQuote = fromQuote
            self.testClock = testClock
            self.invoiceSettings = invoiceSettings
            self.discounts = discounts
            self.defaultTaxRates = defaultTaxRates
        }
        
        private enum CodingKeys: String, CodingKey {
            case customer
            case lineItems = "line_items"
            case metadata
            case description
            case footer
            case expiresAt = "expires_at"
            case header
            case subscriptionData = "subscription_data"
            case collectionMethod = "collection_method"
            case automaticTax = "automatic_tax"
            case transferData = "transfer_data"
            case onBehalfOf = "on_behalf_of"
            case fromQuote = "from_quote"
            case testClock = "test_clock"
            case invoiceSettings = "invoice_settings"
            case discounts
            case defaultTaxRates = "default_tax_rates"
        }
        
        public enum CollectionMethod: String, Codable, Equatable, Sendable {
            case chargeAutomatically = "charge_automatically"
            case sendInvoice = "send_invoice"
        }
        
        public struct SubscriptionData: Codable, Equatable, Sendable {
            public var effectiveDate: Date?
            public var trialPeriodDays: Int?
            
            public init(effectiveDate: Date? = nil, trialPeriodDays: Int? = nil) {
                self.effectiveDate = effectiveDate
                self.trialPeriodDays = trialPeriodDays
            }
            
            private enum CodingKeys: String, CodingKey {
                case effectiveDate = "effective_date"
                case trialPeriodDays = "trial_period_days"
            }
        }
        
        public struct FromQuote: Codable, Equatable, Sendable {
            public var quote: String
            public var isRevision: Bool?
            
            public init(quote: String, isRevision: Bool? = nil) {
                self.quote = quote
                self.isRevision = isRevision
            }
            
            private enum CodingKeys: String, CodingKey {
                case quote
                case isRevision = "is_revision"
            }
        }
        
        public struct InvoiceSettings: Codable, Equatable, Sendable {
            public var daysUntilDue: Int?
            
            public init(daysUntilDue: Int? = nil) {
                self.daysUntilDue = daysUntilDue
            }
            
            private enum CodingKeys: String, CodingKey {
                case daysUntilDue = "days_until_due"
            }
        }
    }
}

extension Stripe.Billing.Quotes {
    // https://docs.stripe.com/api/quotes/update.md
    public enum Update {}
}

extension Stripe.Billing.Quotes.Update {
    public struct Request: Codable, Equatable, Sendable {
        public var customer: Stripe.Customers.Customer.ID?
        public var lineItems: [Stripe.Billing.Quotes.LineItem]?
        public var metadata: [String: String]?
        public var description: String?
        public var footer: String?
        public var expiresAt: Date?
        public var header: String?
        public var subscriptionData: Stripe.Billing.Quotes.Create.Request.SubscriptionData?
        public var collectionMethod: Stripe.Billing.Quotes.Create.Request.CollectionMethod?
        public var automaticTax: Stripe.Billing.Quotes.AutomaticTax?
        public var transferData: Stripe.Billing.Quotes.TransferData?
        public var onBehalfOf: String?
        public var invoiceSettings: Stripe.Billing.Quotes.Create.Request.InvoiceSettings?
        public var discounts: [Stripe.Billing.Quotes.Discount]?
        public var defaultTaxRates: [String]?
        
        public init(
            customer: Stripe.Customers.Customer.ID? = nil,
            lineItems: [Stripe.Billing.Quotes.LineItem]? = nil,
            metadata: [String: String]? = nil,
            description: String? = nil,
            footer: String? = nil,
            expiresAt: Date? = nil,
            header: String? = nil,
            subscriptionData: Stripe.Billing.Quotes.Create.Request.SubscriptionData? = nil,
            collectionMethod: Stripe.Billing.Quotes.Create.Request.CollectionMethod? = nil,
            automaticTax: Stripe.Billing.Quotes.AutomaticTax? = nil,
            transferData: Stripe.Billing.Quotes.TransferData? = nil,
            onBehalfOf: String? = nil,
            invoiceSettings: Stripe.Billing.Quotes.Create.Request.InvoiceSettings? = nil,
            discounts: [Stripe.Billing.Quotes.Discount]? = nil,
            defaultTaxRates: [String]? = nil
        ) {
            self.customer = customer
            self.lineItems = lineItems
            self.metadata = metadata
            self.description = description
            self.footer = footer
            self.expiresAt = expiresAt
            self.header = header
            self.subscriptionData = subscriptionData
            self.collectionMethod = collectionMethod
            self.automaticTax = automaticTax
            self.transferData = transferData
            self.onBehalfOf = onBehalfOf
            self.invoiceSettings = invoiceSettings
            self.discounts = discounts
            self.defaultTaxRates = defaultTaxRates
        }
        
        private enum CodingKeys: String, CodingKey {
            case customer
            case lineItems = "line_items"
            case metadata
            case description
            case footer
            case expiresAt = "expires_at"
            case header
            case subscriptionData = "subscription_data"
            case collectionMethod = "collection_method"
            case automaticTax = "automatic_tax"
            case transferData = "transfer_data"
            case onBehalfOf = "on_behalf_of"
            case invoiceSettings = "invoice_settings"
            case discounts
            case defaultTaxRates = "default_tax_rates"
        }
    }
}

extension Stripe.Billing.Quotes {
    // https://docs.stripe.com/api/quotes/list.md
    public enum List {}
}

extension Stripe.Billing.Quotes.List {
    public struct Request: Codable, Equatable, Sendable {
        public var customer: Stripe.Customers.Customer.ID?
        public var status: Stripe.Billing.Quotes.Status?
        public var testClock: String?
        public var endingBefore: String?
        public var limit: Int?
        public var startingAfter: String?
        
        public init(
            customer: Stripe.Customers.Customer.ID? = nil,
            status: Stripe.Billing.Quotes.Status? = nil,
            testClock: String? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.customer = customer
            self.status = status
            self.testClock = testClock
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }
        
        private enum CodingKeys: String, CodingKey {
            case customer
            case status
            case testClock = "test_clock"
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }
    }
    
    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Billing.Quotes.Quote]
        
        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}

extension Stripe.Billing.Quotes {
    // https://docs.stripe.com/api/quotes/accept.md
    public enum Accept {}
}

extension Stripe.Billing.Quotes.Accept {
    public struct Request: Codable, Equatable, Sendable {
        public init() {}
    }
}

extension Stripe.Billing.Quotes {
    // https://docs.stripe.com/api/quotes/cancel.md
    public enum Cancel {}
}

extension Stripe.Billing.Quotes.Cancel {
    public struct Request: Codable, Equatable, Sendable {
        public init() {}
    }
}

extension Stripe.Billing.Quotes {
    // https://docs.stripe.com/api/quotes/finalize.md
    public enum Finalize {}
}

extension Stripe.Billing.Quotes.Finalize {
    public struct Request: Codable, Equatable, Sendable {
        public var expiresAt: Date?
        
        public init(expiresAt: Date? = nil) {
            self.expiresAt = expiresAt
        }
        
        private enum CodingKeys: String, CodingKey {
            case expiresAt = "expires_at"
        }
    }
}

extension Stripe.Billing.Quotes.List {
    // https://docs.stripe.com/api/quotes/line_items.md
    public enum LineItems {}
}

extension Stripe.Billing.Quotes.List.LineItems {
    public struct Request: Codable, Equatable, Sendable {
        public var endingBefore: String?
        public var limit: Int?
        public var startingAfter: String?
        
        public init(
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }
        
        private enum CodingKeys: String, CodingKey {
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }
    }
    
    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Billing.Quote.LineItem]
        
        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}

extension Stripe.Billing.Quotes.List {
    // https://docs.stripe.com/api/quotes/computed_upfront_line_items.md
    public enum ComputedUpfrontLineItems {}
}

extension Stripe.Billing.Quotes.List.ComputedUpfrontLineItems {
    public struct Request: Codable, Equatable, Sendable {
        public var endingBefore: String?
        public var limit: Int?
        public var startingAfter: String?
        
        public init(
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }
        
        private enum CodingKeys: String, CodingKey {
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }
    }
    
    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Billing.Quote.LineItem]
        
        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}
