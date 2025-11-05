//
//  Stripe Products Tax Rate Types Client.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Products.TaxRates {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/tax_rates/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Stripe.Tax.Rate

        // https://docs.stripe.com/api/tax_rates/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Tax.Rate.ID) async throws -> Stripe.Tax.Rate

        // https://docs.stripe.com/api/tax_rates/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.Tax.Rate.ID, _ request: Update.Request) async throws ->
                Stripe.Tax.Rate

        // https://docs.stripe.com/api/tax_rates/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response
    }
}
