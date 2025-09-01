//
//  Stripe Billing Meter Event Summary Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.MeterEventSummary {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/billing/meter-event-summary/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ meterId: String, _ request: Stripe.Billing.MeterEventSummary.List.Request) async throws -> List.Response
    }
}