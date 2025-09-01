//
//  Stripe Billing Credit Notes Types Client.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Dependencies

extension Stripe.Billing.CreditNotes {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/credit_notes/create.md
        @DependencyEndpoint
        public var create: @Sendable (_ request: Stripe.Billing.CreditNotes.Create.Request) async throws -> Stripe.Billing.Credit.Note
        
        // https://docs.stripe.com/api/credit_notes/update.md
        @DependencyEndpoint
        public var update: @Sendable (_ id: Stripe.Billing.Credit.Note.ID, _ request: Stripe.Billing.CreditNotes.Update.Request) async throws -> Stripe.Billing.Credit.Note
        
        // https://docs.stripe.com/api/credit_notes/retrieve.md
        @DependencyEndpoint
        public var retrieve: @Sendable (_ id: Stripe.Billing.Credit.Note.ID) async throws -> Stripe.Billing.Credit.Note
        
        // https://docs.stripe.com/api/credit_notes/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: Stripe.Billing.CreditNotes.List.Request) async throws -> Stripe.Billing.CreditNotes.List.Response
        
        // https://docs.stripe.com/api/credit_notes/preview.md
        @DependencyEndpoint
        public var preview: @Sendable (_ request: Stripe.Billing.CreditNotes.Preview.Request) async throws -> Stripe.Billing.Credit.Note
        
        // https://docs.stripe.com/api/credit_notes/void.md
        @DependencyEndpoint
        public var void: @Sendable (_ id: Stripe.Billing.Credit.Note.ID, _ request: Stripe.Billing.CreditNotes.Void.Request) async throws -> Stripe.Billing.Credit.Note
        
        // https://docs.stripe.com/api/credit_notes/lines.md
        @DependencyEndpoint
        public var lines: @Sendable (_ id: Stripe.Billing.Credit.Note.ID, _ request: Stripe.Billing.CreditNotes.Lines.Request) async throws -> Stripe.Billing.CreditNotes.Lines.Response
        
        // https://docs.stripe.com/api/credit_notes/preview_lines.md
        @DependencyEndpoint
        public var previewLines: @Sendable (_ request: Stripe.Billing.CreditNotes.PreviewLines.Request) async throws -> Stripe.Billing.CreditNotes.PreviewLines.Response
    }
}
