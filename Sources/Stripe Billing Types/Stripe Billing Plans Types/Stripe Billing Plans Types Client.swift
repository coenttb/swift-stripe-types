//
//  Stripe Billing Plans Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Plans {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/plans/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Stripe.Billing.Plans.Create.Request) async throws ->
                Stripe.Billing.Plan

        // https://docs.stripe.com/api/plans/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.Billing.Plan.ID) async throws -> Stripe.Billing.Plan

        // https://docs.stripe.com/api/plans/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.Billing.Plan.ID, _ request: Stripe.Billing.Plans.Update.Request)
                async throws -> Stripe.Billing.Plan

        // https://docs.stripe.com/api/plans/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ request: Stripe.Billing.Plans.List.Request) async throws ->
                Stripe.Billing.Plans.List.Response

        // https://docs.stripe.com/api/plans/delete.md
        @DependencyEndpoint
        public var delete:
            @Sendable (_ id: Stripe.Billing.Plan.ID) async throws -> DeletedObject<
                Stripe.Billing.Plan
            >
    }
}
