//
//  Stripe Tokens Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Tokens {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/tokens/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Tokens.Create.Request) async throws -> Stripe.Tokens.Token
        
        // https://docs.stripe.com/api/tokens/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Tokens.Token.ID) async throws -> Stripe.Tokens.Token
    }
}
