//
//  File.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 22/09/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Subscription.Schedule {
    // https://docs.stripe.com/api/subscription_schedules/cancel.md
    public enum Cancel {}
}

extension Stripe.Billing.Subscription.Schedule.Cancel {
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
