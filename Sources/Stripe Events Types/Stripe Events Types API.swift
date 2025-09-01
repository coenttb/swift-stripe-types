//
//  Stripe Events Types API.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths
import Tagged

extension Stripe.Events {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/events/retrieve.md
        case retrieve(id: Stripe.Events.Event.ID)
        // https://docs.stripe.com/api/events/list.md
        case list(request: Stripe.Events.List.Request)
    }
}

extension Stripe.Events.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Stripe.Events.API> {
            OneOf {
                // https://docs.stripe.com/api/events/retrieve.md
                URLRouting.Route(.case(Stripe.Events.API.retrieve)) {
                    Method.get
                    Path.v1
                    Path.events
                    Path { Parse(.string.representing(Stripe.Events.Event.ID.self)) }
                }
                
                // https://docs.stripe.com/api/events/list.md
                URLRouting.Route(.case(Stripe.Events.API.list)) {
                    Method.get
                    Path.v1
                    Path.events
                    Parse(.memberwise(Stripe.Events.List.Request.init)) {
                        URLRouting.Query {
                            Optionally {
                                Field("created") { Parse(.string.representing(Stripe.DateFilter.self)) }
                            }
                            Optionally {
                                Field("delivery_success") { Bool.parser() }
                            }
                            Optionally {
                                Field("ending_before") { Parse(.string) }
                            }
                            Optionally {
                                Field("limit") { Digits() }
                            }
                            Optionally {
                                Field("starting_after") { Parse(.string) }
                            }
                            Optionally {
                                Field("type") { Parse(.string) }
                            }
                            
                            // types array is not parsed here - handled separately
                            Always([String]?.none)
                            
                            
                            // TRIED BUT DOESNT WORK
//                            Optionally {
//                                Field("types") { Many { Parse(.string) } }
//                            }
//                            Optionally {
//                                Field("types") {
//                                    "["
//                                    Many {
//                                        Parse(.string)
//                                    } separator: {
//                                        ",".utf8
//                                    } terminator: {
//                                        "]".utf8
//                                    }
//                                }
//                            }
                        }
                    }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let events = Path {
        "events"
    }
}
