//
//  Stripe Balance Transactions Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.BalanceTransactions {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/balance_transactions/retrieve.md
    @DependencyEndpoint
    public var retrieve:
      @Sendable (_ id: Stripe.Balance.Transaction.ID) async throws -> Stripe.Balance.Transaction

    // https://docs.stripe.com/api/balance_transactions/list.md
    @DependencyEndpoint
    public var list:
      @Sendable (_ request: Stripe.BalanceTransactions.List.Request) async throws ->
        Stripe.BalanceTransactions.List.Response
  }
}
