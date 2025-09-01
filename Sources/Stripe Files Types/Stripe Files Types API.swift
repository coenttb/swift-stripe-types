//
//  Stripe Files Types API.swift
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

extension Stripe.Files {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/files/create.md
        case create(request: Stripe.Files.Create.Request)
        // https://docs.stripe.com/api/files/retrieve.md
        case retrieve(id: Stripe.Files.File.ID)
        // https://docs.stripe.com/api/files/list.md
        case list(request: Stripe.Files.List.Request)
    }
}

extension Stripe.Files.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Stripe.Files.API> {
            OneOf {
                // https://docs.stripe.com/api/files/create.md
                URLRouting.Route(.case(Stripe.Files.API.create)) {
                    Method.post
                    Path.v1
                    Path.files
                    // File upload requires multipart/form-data, not handled by URLRouting
                    Body(.form(Stripe.Files.Create.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                // https://docs.stripe.com/api/files/retrieve.md
                URLRouting.Route(.case(Stripe.Files.API.retrieve)) {
                    Method.get
                    Path.v1
                    Path.files
                    Path { Parse(.string.representing(Stripe.Files.File.ID.self)) }
                }
                
                // https://docs.stripe.com/api/files/list.md
                URLRouting.Route(.case(Stripe.Files.API.list)) {
                    Method.get
                    Path.v1
                    Path.files
                    Parse(.memberwise(Stripe.Files.List.Request.init)) {
                        URLRouting.Query {
                            Optionally {
                                Field("created") { Parse(.string.representing(Stripe.DateFilter.self)) }
                            }
                            Optionally {
                                Field("ending_before") { Parse(.string) }
                            }
                            Optionally {
                                Field("limit") { Digits() }
                            }
                            Optionally {
                                Field("purpose") { Parse(.string.representing(Stripe.Files.File.Purpose.self)) }
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
    nonisolated(unsafe) public static let files = Path {
        "files"
    }
}
