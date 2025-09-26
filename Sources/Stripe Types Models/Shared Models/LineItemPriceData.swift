//
//  LineItemPriceData.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Shared

// https://docs.stripe.com/api/payment-link/create.md
// https://docs.stripe.com/api/checkout/sessions/create.md
// Shared price data structure for line items across Payment Links and Checkout Sessions

extension Stripe {
    /// Price data for creating line items inline without a pre-existing Price object
    public struct LineItemPriceData: Codable, Equatable, Hashable, Sendable {
        /// Three-letter ISO currency code, in lowercase
        public let currency: Stripe.Currency
        
        /// The ID of the product that this price will belong to
        public let product: Stripe.Products.Product.ID?
        
        /// Data used to generate a new product object inline
        public let productData: ProductData?
        
        /// The recurring components of a price
        public let recurring: Recurring?
        
        /// Specifies whether the price is considered inclusive of taxes or exclusive of taxes
        public let taxBehavior: TaxBehavior?
        
        /// A positive integer in cents (or 0 for a free price)
        public let unitAmount: Int?
        
        /// Same as unit_amount, but accepts a decimal value with up to 12 decimal places
        public let unitAmountDecimal: String?
        
        private enum CodingKeys: String, CodingKey {
            case currency
            case product
            case productData = "product_data"
            case recurring
            case taxBehavior = "tax_behavior"
            case unitAmount = "unit_amount"
            case unitAmountDecimal = "unit_amount_decimal"
        }
        
        public init(
            currency: Stripe.Currency,
            product: Stripe.Products.Product.ID? = nil,
            productData: ProductData? = nil,
            recurring: Recurring? = nil,
            taxBehavior: TaxBehavior? = nil,
            unitAmount: Int? = nil,
            unitAmountDecimal: String? = nil
        ) {
            self.currency = currency
            self.product = product
            self.productData = productData
            self.recurring = recurring
            self.taxBehavior = taxBehavior
            self.unitAmount = unitAmount
            self.unitAmountDecimal = unitAmountDecimal
        }
        
        /// Product data for creating a product inline
        public struct ProductData: Codable, Equatable, Hashable, Sendable {
            /// The product's name, meant to be displayable to the customer
            public let name: String
            
            /// The product's description, meant to be displayable to the customer
            public let description: String?
            
            /// A list of up to 8 URLs of images for this product
            public let images: [String]?
            
            /// Set of key-value pairs that you can attach to an object
            public let metadata: [String: String]?
            
            /// A tax code ID
            public let taxCode: String?
            
            private enum CodingKeys: String, CodingKey {
                case name
                case description
                case images
                case metadata
                case taxCode = "tax_code"
            }
            
            public init(
                name: String,
                description: String? = nil,
                images: [String]? = nil,
                metadata: [String: String]? = nil,
                taxCode: String? = nil
            ) {
                self.name = name
                self.description = description
                self.images = images
                self.metadata = metadata
                self.taxCode = taxCode
            }
        }
        
        /// The recurring components of a price
        public struct Recurring: Codable, Equatable, Hashable, Sendable {
            /// Specifies billing frequency
            public let interval: Stripe.Interval
            
            /// The number of intervals between subscription billings
            public let intervalCount: Int?
            
            private enum CodingKeys: String, CodingKey {
                case interval
                case intervalCount = "interval_count"
            }
            
            public init(
                interval: Stripe.Interval,
                intervalCount: Int? = nil
            ) {
                self.interval = interval
                self.intervalCount = intervalCount
            }
            
            // Using shared Stripe.Interval type
            public typealias Interval = Stripe.Interval
        }
        
        public enum TaxBehavior: String, Codable, Sendable {
            case exclusive
            case inclusive
            case unspecified
        }
    }
}
