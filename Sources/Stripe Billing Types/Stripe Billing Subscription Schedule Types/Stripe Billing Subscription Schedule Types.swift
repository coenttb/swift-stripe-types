//
//  Stripe Billing Subscription Schedule Types Billing Subscription Schedule.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared


extension Stripe.Billing.Subscription.Schedule {
    public enum StartDate: Equatable, Sendable {
        case now
        case date(Date)
    }
}

extension Stripe.Billing.Subscription.Schedule.StartDate: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        // Try to decode as string first (for "now")
        if let stringValue = try? container.decode(String.self), stringValue == "now" {
            self = .now
            return
        }

        // Try to decode as Date (timestamp)
        if let date = try? container.decode(Date.self) {
            self = .date(date)
            return
        }

        // Try to decode as Int (Unix timestamp)
        if let timestamp = try? container.decode(Int.self) {
            self = .date(Date(timeIntervalSince1970: TimeInterval(timestamp)))
            return
        }

        throw DecodingError.dataCorruptedError(
            in: container,
            debugDescription: "StartDate must be either 'now' string or a timestamp"
        )
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .now:
            try container.encode("now")
        case .date(let date):
            // Stripe expects Unix timestamp as integer
            try container.encode(Int(date.timeIntervalSince1970))
        }
    }
}

extension Stripe.Billing.Subscription.Schedule {
    public enum ProrationBehavior: String, Codable, Equatable, Sendable {
        case createProrations = "create_prorations"
        case none
        case alwaysInvoice = "always_invoice"
    }
}


extension Stripe.Billing.Subscription.Schedule {
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
}
 
extension Stripe.Billing.Subscription.Schedule {
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
}
//
//extension Stripe.Billing.Subscription.Schedule {
//    public struct InvoiceSettings: Codable, Equatable, Sendable {
//        /// Number of days within which a customer must pay invoices
//        public var daysUntilDue: Int?
//
//        public init(daysUntilDue: Int? = nil) {
//            self.daysUntilDue = daysUntilDue
//        }
//
//        private enum CodingKeys: String, CodingKey {
//            case daysUntilDue = "days_until_due"
//        }
//    }
//}
//
//extension Stripe.Billing.Subscription.Schedule {
//    public enum CollectionMethod: String, Codable, Equatable, Sendable {
//        case chargeAutomatically = "charge_automatically"
//        case sendInvoice = "send_invoice"
//    }
//}
//
//extension Stripe.Billing.Subscription.Schedule {
//    public enum EndBehavior: String, Codable, Equatable, Sendable {
//        case release
//        case cancel
//    }
//}
