//
//  Stripe Billing Invoice Items Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.InvoiceItems {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/invoiceitems/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Billing.InvoiceItems.Create.Request) async throws -> Stripe.Billing.Invoice.Item
        
        // https://docs.stripe.com/api/invoiceitems/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Billing.Invoice.Item.ID) async throws -> Stripe.Billing.Invoice.Item
        
        // https://docs.stripe.com/api/invoiceitems/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Billing.Invoice.Item.ID, _ request: Stripe.Billing.InvoiceItems.Update.Request) async throws -> Stripe.Billing.Invoice.Item
        
        // https://docs.stripe.com/api/invoiceitems/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Billing.InvoiceItems.List.Request) async throws -> Stripe.Billing.InvoiceItems.List.Response
        
        // https://docs.stripe.com/api/invoiceitems/delete.md
        @DependencyEndpoint
        public var delete: @Sendable (_ id: Stripe.Billing.Invoice.Item.ID) async throws -> DeletedObject<Stripe.Billing.Invoice.Item>
    }
}
