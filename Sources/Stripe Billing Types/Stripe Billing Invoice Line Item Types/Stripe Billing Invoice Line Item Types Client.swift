//
//  Stripe Billing Invoice Line Item Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Billing.Invoice.LineItems {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/invoice-line-item/retrieve.md
        @DependencyEndpoint
        public var list:
            @Sendable (
                _ invoiceId: String, _ request: Stripe.Billing.Invoice.LineItems.List.Request
            )
                async throws -> Stripe.Billing.Invoice.LineItem.List

        // https://docs.stripe.com/api/invoice-line-item/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (
                _ invoiceId: String, _ lineItemId: String,
                _ request: Stripe.Billing.Invoice.LineItems.Update.Request
            ) async throws -> Stripe.Billing.Invoice.LineItem

        // https://docs.stripe.com/api/invoice-line-item/bulk.md
        @DependencyEndpoint
        public var addLines:
            @Sendable (
                _ invoiceId: String, _ request: Stripe.Billing.Invoice.LineItems.AddLines.Request
            )
                async throws -> Stripe.Billing.Invoice

        // https://docs.stripe.com/api/invoice-line-item/bulk-update.md
        @DependencyEndpoint
        public var updateLines:
            @Sendable (
                _ invoiceId: String, _ request: Stripe.Billing.Invoice.LineItems.UpdateLines.Request
            ) async throws -> Stripe.Billing.Invoice

        // https://docs.stripe.com/api/invoice-line-item/invoices/remove-lines/bulk.md
        @DependencyEndpoint
        public var removeLines:
            @Sendable (
                _ invoiceId: String, _ request: Stripe.Billing.Invoice.LineItems.RemoveLines.Request
            ) async throws -> Stripe.Billing.Invoice
    }
}
