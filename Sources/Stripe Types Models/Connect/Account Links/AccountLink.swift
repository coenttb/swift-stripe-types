//
//  AccountLink.swift
//  
//
//  Created by Andrew Edwards on 11/3/19.
//

import Foundation
import Stripe_Types_Shared

// https://docs.stripe.com/api/account_links/object.md

extension Stripe.Connect.Account {
    /// The [Account Link Object](https://stripe.com/docs/api/account_links/object) .
    public struct Link: Codable, Hashable, Sendable {
        /// String representing the object’s type. Objects of the same type share the same value.
        public var object: String
        /// Time at which the object was created. Measured in seconds since the Unix epoch.
        public var created: Date
        /// The timestamp at which this account link will expire.
        public var expiresAt: Date?
        /// The URL for the account link.
        public var url: String?

        public init(
            object: String,
            created: Date,
            expiresAt: Date? = nil,
            url: String? = nil
        ) {
            self.object = object
            self.created = created
            self.expiresAt = expiresAt
            self.url = url
        }
    }
}


extension Stripe.Connect.Account.Link {
    public enum CreationType: String, Codable, Sendable {
        /// Provides a form for inputting outstanding requirements. Send the user to the form in this mode to just collect the new information you need.
        case accountOnboarding = "account_onboarding"
        /// Displays the fields that are already populated on the account object, and allows your user to edit previously provided information. Consider framing this as “edit my profile” or “update my verification information”.
        case accountUpdate = "account_update"
    }
}

extension Stripe.Connect.Account.Link {
    public enum CreationCollectType: String, Codable, Sendable {
        case currentlyDue = "currently_due"
        case eventuallyDue = "eventually_due"
    }
}
