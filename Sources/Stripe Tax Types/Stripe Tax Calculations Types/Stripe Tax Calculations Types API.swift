//
//  Stripe Tax Calculations Types API.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths
import Tagged

extension Stripe.Tax.Calculations {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/tax/calculations/create.md
        case create(request: Create.Request)
        // https://docs.stripe.com/api/tax/calculations/retrieve.md  
        case retrieve(id: Stripe.Tax.Calculation.ID)
        // https://docs.stripe.com/api/tax/calculations/line_items.md
        case listLineItems(id: Stripe.Tax.Calculation.ID, request: List.LineItems.Request)
    }
}

extension Stripe.Tax.Calculations.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Tax.Calculations.API> {
            OneOf {
                Route(.case(Stripe.Tax.Calculations.API.create)) {
                    Method.post
                    Path.v1
                    Path.tax
                    Path.calculations
                    Body(.form(Stripe.Tax.Calculations.Create.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                Route(.case(Stripe.Tax.Calculations.API.retrieve)) {
                    Method.get
                    Path.v1
                    Path.tax
                    Path.calculations
                    Path { Parse(.string.representing(Stripe.Tax.Calculation.ID.self)) }
                }
                
                Route(.case(Stripe.Tax.Calculations.API.listLineItems)) {
                    Method.get
                    Path.v1
                    Path.tax
                    Path.calculations
                    Path { Parse(.string.representing(Stripe.Tax.Calculation.ID.self)) }
                    Path.lineItems
                    Parse(.memberwise(Stripe.Tax.Calculations.List.LineItems.Request.init)) {
                        Query {
                            Optionally {
                                Field("ending_before") { Parse(.string) }
                            }
                            Optionally {
                                Field("limit") { Digits() }
                            }
                            Optionally {
                                Field("starting_after") { Parse(.string) }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let tax = Path {
        "tax"
    }
    
    nonisolated(unsafe) public static let calculations = Path {
        "calculations"
    }
    
    nonisolated(unsafe) public static let lineItems = Path {
        "line_items"
    }
}
