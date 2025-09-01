import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies
import Tagged

extension Stripe.Customers.CashBalanceTransactions {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/cash_balance_transactions/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ transactionId: CashBalanceTransaction.ID) async throws -> CashBalanceTransaction
        
        // https://docs.stripe.com/api/cash_balance_transactions/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: List.Request) async throws -> List.Response
    }
}