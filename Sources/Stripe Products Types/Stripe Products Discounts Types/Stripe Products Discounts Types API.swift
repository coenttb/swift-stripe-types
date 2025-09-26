//
//  Stripe Products Discounts Types API.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths
import Tagged

extension Stripe.Products.Discounts {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/discounts/delete.md
        case deleteCustomerDiscount(customerId: Stripe.Customers.Customer.ID)
        // https://docs.stripe.com/api/discounts/subscription_delete.md
        case deleteSubscriptionDiscount(subscriptionId: Stripe.Billing.Subscription.ID)
    }
}

extension Stripe.Products.Discounts.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Products.Discounts.API> {
            OneOf {
                Route(.case(Stripe.Products.Discounts.API.deleteCustomerDiscount)) {
                    Method.delete
                    Path.v1
                    Path.customers
                    Path { Parse(.string.representing(Stripe.Customers.Customer.ID.self)) }
                    Path.discount
                }
                
                Route(.case(Stripe.Products.Discounts.API.deleteSubscriptionDiscount)) {
                    Method.delete
                    Path.v1
                    Path.subscriptions
                    Path { Parse(.string.representing(Stripe.Billing.Subscription.ID.self)) }
                    Path.discount
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    public static let discount = Path {
        "discount"
    }
    
    public static let customers = Path {
        "customers"
    }
    
    public static let subscriptions = Path {
        "subscriptions"
    }
}
