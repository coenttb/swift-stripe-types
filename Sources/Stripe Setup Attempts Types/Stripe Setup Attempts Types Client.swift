//
//  Stripe Setup Attempts Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Setup.Attempts {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/setup_attempts/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.Setup.Attempts.List.Request) async throws ->
        Stripe.Setup.Attempts.List.Response
  }
}
