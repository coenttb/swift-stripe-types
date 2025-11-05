//
//  Stripe Events Types Events.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Events {
    // https://docs.stripe.com/api/events/list.md
    public enum List {}
}

// https://docs.stripe.com/api/events/list.md
extension Stripe.Events.List {
    public struct Request: Codable, Equatable, Sendable {
        /// Only return events created during the given date interval
        public let created: Stripe.DateFilter?
        /// Filter events by whether all webhooks were successfully delivered
        public let deliverySuccess: Bool?
        /// A cursor for use in pagination
        public let endingBefore: String?
        /// A limit on the number of objects to be returned
        public let limit: Int?
        /// A cursor for use in pagination
        public let startingAfter: String?
        /// A string containing a specific event name, or group of events using * as a wildcard
        public let type: String?
        /// An array of up to 20 strings containing specific event names
        public let types: [String]?

        private enum CodingKeys: String, CodingKey {
            case created
            case deliverySuccess = "delivery_success"
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
            case type
            case types
        }

        public init(
            created: Stripe.DateFilter? = nil,
            deliverySuccess: Bool? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil,
            type: String? = nil,
            types: [String]? = nil
        ) {
            self.created = created
            self.deliverySuccess = deliverySuccess
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
            self.type = type
            self.types = types
        }
    }

    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Events.Event]

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
            data: [Stripe.Events.Event]
        ) {
            self.object = object
            self.url = url
            self.hasMore = hasMore
            self.data = data
        }
    }
}
