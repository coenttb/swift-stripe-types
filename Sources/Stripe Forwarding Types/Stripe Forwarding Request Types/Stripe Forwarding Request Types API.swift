import CasePaths
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting

extension Stripe.Forwarding.Request {
  @CasePathable
  @dynamicMemberLookup
  public enum API: Equatable, Sendable {
    // https://docs.stripe.com/api/forwarding/request/create.md
    case create(request: Create.Request)
    // https://docs.stripe.com/api/forwarding/request/retrieve.md
    case retrieve(id: Stripe.Forwarding.Request.ID)
    // https://docs.stripe.com/api/forwarding/request/list.md
    case list(request: List.Request)
  }
}

extension Stripe.Forwarding.Request.API {
  public struct Router: ParserPrinter, Sendable {
    public init() {}

    public var body: some URLRouting.Router<Stripe.Forwarding.Request.API> {
      OneOf {
        Route(.case(Stripe.Forwarding.Request.API.create)) {
          Method.post
          Path.v1
          Path.forwarding
          Path.requests
          Body(
            .form(Stripe.Forwarding.Request.Create.Request.self, decoder: .stripe, encoder: .stripe)
          )
        }

        Route(.case(Stripe.Forwarding.Request.API.retrieve)) {
          Method.get
          Path.v1
          Path.forwarding
          Path.requests
          Path { Parse(.string.representing(Stripe.Forwarding.Request.ID.self)) }
        }
        //                TODO
        //                Route(.case(Stripe.Forwarding.Request.API.list)) {
        //                    Method.get
        //                    Path.v1
        //                    Path.forwarding
        //                    Path.requests
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
        //                    }
        //                    .query(Stripe.Forwarding.Request.List.Request?.self)
        //                }
      }
    }
  }
}

extension Path<PathBuilder.Component<String>> {
  public static let forwarding = Path {
    "forwarding"
  }

  public static let requests = Path {
    "requests"
  }
}
