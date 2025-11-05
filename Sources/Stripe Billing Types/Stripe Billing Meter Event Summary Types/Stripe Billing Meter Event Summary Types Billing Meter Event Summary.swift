//
//  Stripe Billing Meter Event Summary Types Billing Meter Event Summary.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.MeterEventSummary {
    public struct MeterEventSummary: Codable, Equatable, Sendable, Identifiable {
        public typealias ID = Tagged<Self, String>
        public let id: ID
        public let object: String
        public let aggregatedValue: Double
        public let startTime: Int
        public let endTime: Int
        public let meter: String
        public let livemode: Bool

        public init(
            id: ID,
            object: String,
            aggregatedValue: Double,
            startTime: Int,
            endTime: Int,
            meter: String,
            livemode: Bool
        ) {
            self.id = id
            self.object = object
            self.aggregatedValue = aggregatedValue
            self.startTime = startTime
            self.endTime = endTime
            self.meter = meter
            self.livemode = livemode
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case object
            case aggregatedValue = "aggregated_value"
            case startTime = "start_time"
            case endTime = "end_time"
            case meter
            case livemode
        }
    }
}

extension Stripe.Billing.MeterEventSummary {
    // https://docs.stripe.com/api/billing/meter-event-summary/list.md
    public enum List {}
}

extension Stripe.Billing.MeterEventSummary.List {
    public struct Request: Codable, Equatable, Sendable {
        /// Customer to fetch event summaries for
        public var customer: Stripe.Customers.Customer.ID
        /// Start of aggregation period (must align with minute/hour/day boundaries)
        public var startTime: Int
        /// End of aggregation period (must align with minute/hour/day boundaries)
        public var endTime: Int
        /// Aggregation granularity
        public var valueGroupingWindow: ValueGroupingWindow?
        /// Pagination cursor for previous page
        public var endingBefore: String?
        /// Number of objects to return (1-100, default 10)
        public var limit: Int?
        /// Pagination cursor for next page
        public var startingAfter: String?

        public enum ValueGroupingWindow: String, Codable, Equatable, Sendable {
            case hour
            case day
        }

        public init(
            customer: Stripe.Customers.Customer.ID,
            startTime: Int,
            endTime: Int,
            valueGroupingWindow: ValueGroupingWindow? = nil,
            endingBefore: String? = nil,
            limit: Int? = nil,
            startingAfter: String? = nil
        ) {
            self.customer = customer
            self.startTime = startTime
            self.endTime = endTime
            self.valueGroupingWindow = valueGroupingWindow
            self.endingBefore = endingBefore
            self.limit = limit
            self.startingAfter = startingAfter
        }

        private enum CodingKeys: String, CodingKey {
            case customer
            case startTime = "start_time"
            case endTime = "end_time"
            case valueGroupingWindow = "value_grouping_window"
            case endingBefore = "ending_before"
            case limit
            case startingAfter = "starting_after"
        }
    }

    public struct Response: Codable, Sendable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Stripe.Billing.MeterEventSummary.MeterEventSummary]

        private enum CodingKeys: String, CodingKey {
            case object
            case url
            case hasMore = "has_more"
            case data
        }
    }
}
