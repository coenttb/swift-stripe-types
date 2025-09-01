//
//  Stripe Setup Intents Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Setup.Intents {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/setup_intents/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Setup.Intents.Create.Request) async throws -> Stripe.Setup.Intent
        
        // https://docs.stripe.com/api/setup_intents/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Setup.Intent.ID) async throws -> Stripe.Setup.Intent
        
        // https://docs.stripe.com/api/setup_intents/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Setup.Intent.ID, _ request: Stripe.Setup.Intents.Update.Request) async throws -> Stripe.Setup.Intent
        
        // https://docs.stripe.com/api/setup_intents/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Setup.Intents.List.Request) async throws -> Stripe.Setup.Intents.List.Response
        
        // https://docs.stripe.com/api/setup_intents/confirm.md
        @DependencyEndpoint
        public var confirm: @Sendable (_ id: Stripe.Setup.Intent.ID, _ request: Stripe.Setup.Intents.Confirm.Request) async throws -> Stripe.Setup.Intent
        
        // https://docs.stripe.com/api/setup_intents/cancel.md
        @DependencyEndpoint
        public var cancel: @Sendable (_ id: Stripe.Setup.Intent.ID, _ request: Stripe.Setup.Intents.Cancel.Request) async throws -> Stripe.Setup.Intent
        
        // https://docs.stripe.com/api/setup_intents/verify_microdeposits.md
        @DependencyEndpoint
        public var verifyMicrodeposits: @Sendable (_ id: Stripe.Setup.Intent.ID, _ request: Stripe.Setup.Intents.VerifyMicrodeposits.Request) async throws -> Stripe.Setup.Intent
    }
}
