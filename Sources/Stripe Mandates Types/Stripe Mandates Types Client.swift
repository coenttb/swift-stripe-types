//
//  Stripe Mandates Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Mandates {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/mandates/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.Mandates.Mandate.ID) async throws -> Stripe.Mandates.Mandate
    }
}
