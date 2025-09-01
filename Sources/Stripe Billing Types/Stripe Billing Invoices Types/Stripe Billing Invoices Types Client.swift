//
//  Stripe Billing Invoices Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.Invoices {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/invoices/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Billing.Invoices.Create.Request) async throws -> Stripe.Billing.Invoice
        
        // https://docs.stripe.com/api/invoices/create_preview.md
        @DependencyEndpoint
        public var createPreview: @Sendable (_ request: Stripe.Billing.Invoices.CreatePreview.Request) async throws -> Stripe.Billing.Invoice
        
        // https://docs.stripe.com/api/invoices/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Billing.Invoice.ID) async throws -> Stripe.Billing.Invoice
        
        // https://docs.stripe.com/api/invoices/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Billing.Invoice.ID, _ request: Stripe.Billing.Invoices.Update.Request) async throws -> Stripe.Billing.Invoice
        
        // https://docs.stripe.com/api/invoices/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Billing.Invoices.List.Request) async throws -> Stripe.Billing.Invoices.List.Response
        
        // https://docs.stripe.com/api/invoices/delete.md
        @DependencyEndpoint
        public var delete: @Sendable (_ id: Stripe.Billing.Invoice.ID) async throws -> DeletedObject<Stripe.Billing.Invoice>
        
        // https://docs.stripe.com/api/invoices/finalize_invoice.md
        @DependencyEndpoint
        public var finalize: @Sendable (_ id: Stripe.Billing.Invoice.ID, _ request: Stripe.Billing.Invoices.Finalize.Request) async throws -> Stripe.Billing.Invoice
        
        // https://docs.stripe.com/api/invoices/pay.md
        @DependencyEndpoint
        public var pay: @Sendable (_ id: Stripe.Billing.Invoice.ID, _ request: Stripe.Billing.Invoices.Pay.Request) async throws -> Stripe.Billing.Invoice
        
        // https://docs.stripe.com/api/invoices/send.md
        @DependencyEndpoint
        public var send: @Sendable (_ id: Stripe.Billing.Invoice.ID, _ request: Stripe.Billing.Invoices.Send.Request) async throws -> Stripe.Billing.Invoice
        
        // https://docs.stripe.com/api/invoices/void.md
        @DependencyEndpoint
        public var void: @Sendable (_ id: Stripe.Billing.Invoice.ID, _ request: Stripe.Billing.Invoices.Void.Request) async throws -> Stripe.Billing.Invoice
    }
}
