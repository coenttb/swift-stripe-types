//
//  Stripe Setup Attempts Types Setup Attempts.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Setup.Attempts {
    // https://docs.stripe.com/api/setup_attempts/list.md
    public enum List {}
}

// MARK: - List
extension Stripe.Setup.Attempts.List {
    public struct Request: Codable, Equatable, Sendable {
        /// Only return SetupAttempts created by the specified SetupIntent
        public let setupIntent: Stripe.Setup.Intent.ID
        /// Only return SetupAttempts created during the given date interval
        public let created: Stripe.DateFilter?
        /// A cursor for use in pagination
        public let endingBefore: String?
        /// A limit on the number of objects to be returned
        public let limit: Int?
        /// A cursor for use in pagination
        public let startingAfter: String?
        
        private enum CodingKeys: String, CodingKey {
            case setupIntent = "setup_intent"
            case created
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }
        
        public init(
            setupIntent: Stripe.Setup.Intent.ID,
            created: Stripe.DateFilter? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.setupIntent = setupIntent
            self.created = created
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }
    }
    
    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Setup.Attempt]
        
        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
        
        public init(
            object: String,
            url: String,
            hasMore: Bool,
            data: [Stripe.Setup.Attempt]
        ) {
            self.object = object
            self.url = url
            self.hasMore = hasMore
            self.data = data
        }
    }
}
