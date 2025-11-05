//
//  Stripe Disputes Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Disputes {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/disputes/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.Disputes.Dispute.ID) async throws -> Stripe.Disputes.Dispute

        // https://docs.stripe.com/api/disputes/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.Disputes.Dispute.ID, _ request: Stripe.Disputes.Update.Request)
                async throws -> Stripe.Disputes.Dispute

        // https://docs.stripe.com/api/disputes/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ request: Stripe.Disputes.List.Request) async throws ->
                Stripe.Disputes.List.Response

        // https://docs.stripe.com/api/disputes/close.md
        @DependencyEndpoint
        public var close:
            @Sendable (_ id: Stripe.Disputes.Dispute.ID) async throws -> Stripe.Disputes.Dispute
    }
}
