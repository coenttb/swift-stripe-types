import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged

extension Stripe.Customers.BankAccounts {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/customer_bank_accounts/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: Create.Request)
                async throws
                -> BankAccount

        // https://docs.stripe.com/api/customer_bank_accounts/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ bankAccountId: BankAccount.ID)
                async throws -> BankAccount

        // https://docs.stripe.com/api/customer_bank_accounts/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (
                _ customerId: Stripe.Customers.Customer.ID, _ bankAccountId: BankAccount.ID,
                _ request: Update.Request
            ) async throws -> BankAccount

        // https://docs.stripe.com/api/customer_bank_accounts/list.md
        @DependencyEndpoint
        public var list:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ request: List.Request)
                async throws
                -> List.Response

        // https://docs.stripe.com/api/customer_bank_accounts/delete.md
        @DependencyEndpoint
        public var delete:
            @Sendable (_ customerId: Stripe.Customers.Customer.ID, _ bankAccountId: BankAccount.ID)
                async throws -> DeletedObject<BankAccount>

        // https://docs.stripe.com/api/customer_bank_accounts/verify.md
        @DependencyEndpoint
        public var verify:
            @Sendable (
                _ customerId: Stripe.Customers.Customer.ID, _ bankAccountId: BankAccount.ID,
                _ request: Verify.Request
            ) async throws -> BankAccount
    }
}
