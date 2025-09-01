//
//  Stripe Events Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Events {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/events/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Events.Event.ID) async throws -> Stripe.Events.Event
        
        // https://docs.stripe.com/api/events/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Events.List.Request) async throws -> Stripe.Events.List.Response
    }
}
