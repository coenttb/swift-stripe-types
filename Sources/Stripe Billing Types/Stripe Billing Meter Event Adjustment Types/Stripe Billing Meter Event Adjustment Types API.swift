//
//  Stripe Billing Meter Event Adjustment Types API.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths

extension Stripe.Billing.MeterEventAdjustments {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/billing/meter-event-adjustment/create.md
        case create(request: Create.Request)
    }
}

extension Stripe.Billing.MeterEventAdjustments.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Billing.MeterEventAdjustments.API> {
            OneOf {
                Route(.case(Stripe.Billing.MeterEventAdjustments.API.create)) {
                    Method.post
                    Path.v1
                    Path.billing
                    Path.meter_event_adjustments
                    Body(.form(Stripe.Billing.MeterEventAdjustments.Create.Request.self, decoder: .stripe, encoder: .stripe))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    public static let meter_event_adjustments = Path {
        "meter_event_adjustments"
    }
}
