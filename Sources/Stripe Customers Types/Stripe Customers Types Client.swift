//
//  File.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 05/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies


extension Stripe.Customers {
    public struct Client: Sendable {
        public var create: @Sendable (_ request: Stripe.Customers.Create.Request) async throws -> Customer
        
        public var update: @Sendable (_ id: Customer.ID, _ request: Stripe.Customers.Update.Request) async throws -> Customer
        
        public var retrieve: @Sendable (_ id: Customer.ID) async throws -> Customer
        
        public var list: @Sendable (_ request: Stripe.Customers.List.Request) async throws -> Stripe.Customers.List.Response
        
        public var delete: @Sendable (_ id: Customer.ID) async throws -> DeletedObject<Customer>
        
        public var search: @Sendable (_ request: Stripe.Customers.Search.Request) async throws -> Stripe.Customers.Search.Response
        
        public var bankAccounts: Stripe.Customers.BankAccounts.Client
        public var cards: Stripe.Customers.Cards.Client
        public var cashBalance: Stripe.Customers.CashBalance.Client
        public var cashBalanceTransactions: Stripe.Customers.CashBalanceTransactions.Client
        
        public init(
            create: @escaping @Sendable (_ request: Stripe.Customers.Create.Request) async throws -> Customer,
            update: @escaping @Sendable (_ id: Customer.ID, _ request: Stripe.Customers.Update.Request) async throws -> Customer,
            retrieve: @escaping @Sendable (_ id: Customer.ID) async throws -> Customer,
            list: @escaping @Sendable (_ request: Stripe.Customers.List.Request) async throws -> Stripe.Customers.List.Response,
            delete: @escaping @Sendable (_ id: Customer.ID) async throws -> DeletedObject<Customer>,
            search: @escaping @Sendable (_ request: Stripe.Customers.Search.Request) async throws -> Stripe.Customers.Search.Response,
            bankAccounts: Stripe.Customers.BankAccounts.Client,
            cards: Stripe.Customers.Cards.Client,
            cashBalance: Stripe.Customers.CashBalance.Client,
            cashBalanceTransactions: Stripe.Customers.CashBalanceTransactions.Client
        ) {
            self.create = create
            self.update = update
            self.retrieve = retrieve
            self.list = list
            self.delete = delete
            self.search = search
            self.bankAccounts = bankAccounts
            self.cards = cards
            self.cashBalance = cashBalance
            self.cashBalanceTransactions = cashBalanceTransactions
        }
    }
}
