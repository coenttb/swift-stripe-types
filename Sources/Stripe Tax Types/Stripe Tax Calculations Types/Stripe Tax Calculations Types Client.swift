//
//  Stripe Tax Calculations Types Client.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Tax.Calculations {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/tax/calculations/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Create.Request) async throws -> Stripe.Tax.Calculation
        
        // https://docs.stripe.com/api/tax/calculations/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Tax.Calculation.ID) async throws -> Stripe.Tax.Calculation
        
        // https://docs.stripe.com/api/tax/calculations/line_items.md
        @DependencyEndpoint
        public var listLineItems: @Sendable (_ id: Stripe.Tax.Calculation.ID, _ request: List.LineItems.Request) async throws -> List.LineItems.Response
    }
}
