//
//  Stripe Billing Meters Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.Meters {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/billing/meter/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Billing.Meters.Create.Request) async throws -> Meter
        
        // https://docs.stripe.com/api/billing/meter/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Billing.Meters.Meter.ID) async throws -> Stripe.Billing.Meters.Meter
        
        // https://docs.stripe.com/api/billing/meter/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Billing.Meters.Meter.ID, _ request: Stripe.Billing.Meters.Update.Request) async throws -> Meter
        
        // https://docs.stripe.com/api/billing/meter/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Billing.Meters.List.Request) async throws -> Stripe.Billing.Meters.List.Response
        
        // https://docs.stripe.com/api/billing/meter/deactivate.md
        @DependencyEndpoint
        public var deactivate: @Sendable (_ id: Stripe.Billing.Meters.Meter.ID, _ request: Stripe.Billing.Meters.Deactivate.Request) async throws -> Meter
        
        // https://docs.stripe.com/api/billing/meter/reactivate.md
        @DependencyEndpoint
        public var reactivate: @Sendable (_ id: Stripe.Billing.Meters.Meter.ID, _ request: Stripe.Billing.Meters.Reactivate.Request) async throws -> Meter
    }
}
