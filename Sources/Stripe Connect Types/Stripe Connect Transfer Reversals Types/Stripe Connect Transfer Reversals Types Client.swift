//
//  Stripe Connect Transfer Reversals Types Client.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Connect.Transfer.Reversals {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/transfer_reversals/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ transferId: Stripe.Connect.Transfer.ID, _ request: Create.Request)
                async throws
                -> Stripe.Connect.Transfer.Reversal

        // https://docs.stripe.com/api/transfer_reversals/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (
                _ transferId: Stripe.Connect.Transfer.ID,
                _ reversalId: Stripe.Connect.Transfer.Reversal.ID
            ) async throws -> Stripe.Connect.Transfer.Reversal

        // https://docs.stripe.com/api/transfer_reversals/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (
                _ transferId: Stripe.Connect.Transfer.ID,
                _ reversalId: Stripe.Connect.Transfer.Reversal.ID,
                _ request: Update.Request
            ) async throws -> Stripe.Connect.Transfer.Reversal

        // https://docs.stripe.com/api/transfer_reversals/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ transferId: Stripe.Connect.Transfer.ID, _ request: List.Request)
                async throws ->
                List.Response
    }
}
