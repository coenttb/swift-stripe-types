import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import URLRouting
import CasePaths
import Tagged

extension Stripe.Fraud.Reviews {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/radar/reviews/retrieve.md
        case retrieve(id: Review.ID)
        // https://docs.stripe.com/api/radar/reviews/list.md
        case list(request: List.Request)
        // https://docs.stripe.com/api/radar/reviews/approve.md
        case approve(id: Review.ID, request: Approve.Request)
    }
}

extension Stripe.Fraud.Reviews.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Fraud.Reviews.API> {
            OneOf {
                URLRouting.Route(.case(Stripe.Fraud.Reviews.API.retrieve)) {
                    Method.get
                    Path.v1
                    Path { "reviews" }
                    Path { Parse(.string.representing(Stripe.Fraud.Reviews.Review.ID.self)) }
                }
                
//                URLRouting.Route(.case(Stripe.Fraud.Reviews.API.list)) {
//                    Method.get
//                    Path.v1
//                    Path { "reviews" }
//                    Query {
//                        Optionally {
//                            Field("ending_before") { Parse(.string) }
//                        }
//                        Optionally {
//                            Field("limit") { Digits() }
//                        }
//                        Optionally {
//                            Field("starting_after") { Parse(.string) }
//                        }
//                        Optionally {
//                            Field("created", .inlineArray) { Stripe.DateFilter.queryParser() }
//                        }
//                    }
//                    .query(Stripe.Fraud.Reviews.API.List.Request?.self)
//                }
                
                URLRouting.Route(.case(Stripe.Fraud.Reviews.API.approve)) {
                    Method.post
                    Path.v1
                    Path { "reviews" }
                    Path { Parse(.string.representing(Stripe.Fraud.Reviews.Review.ID.self)) }
                    Path.approve
                    Body(.form(Stripe.Fraud.Reviews.API.Approve.Request.self, decoder: .stripe, encoder: .stripe))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    public static let reviews = Path {
        "reviews"
    }
    
    public static let approve = Path {
        "approve"
    }
}
