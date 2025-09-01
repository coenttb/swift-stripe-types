//
//  Stripe Files Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Files {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/files/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Files.Create.Request) async throws -> Stripe.Files.File
        
        // https://docs.stripe.com/api/files/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Files.File.ID) async throws -> Stripe.Files.File
        
        // https://docs.stripe.com/api/files/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Files.List.Request) async throws -> Stripe.Files.List.Response
    }
}
