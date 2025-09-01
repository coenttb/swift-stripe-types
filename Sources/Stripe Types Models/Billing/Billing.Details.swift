//
//  Billing.Details.swift
//  Stripe
//
//  Created by Andrew Edwards on 4/15/19.
//

import Stripe_Types_Shared

extension BillingModel {
    public struct Details: Codable, Hashable, Sendable {
        /// Billing address.
        public var address: Address?
        /// Email address.
        public var email: String?
        /// Full name.
        public var name: String?
        /// Billing phone number (including extension).
        public var phone: String?

        public init(
            address: Address? = nil,
            email: String? = nil,
            name: String? = nil,
            phone: String? = nil
        ) {
            self.address = address
            self.email = email
            self.name = name
            self.phone = phone
        }
    }
}
