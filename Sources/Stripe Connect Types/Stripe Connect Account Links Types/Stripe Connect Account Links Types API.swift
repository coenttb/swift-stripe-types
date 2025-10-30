import CasePaths
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting

extension Stripe.Connect.AccountLinks {
  @CasePathable
  @dynamicMemberLookup
  public enum API: Equatable, Sendable {
    // https://docs.stripe.com/api/account_links/create.md
    case create(request: Stripe.Connect.AccountLinks.Create.Request)
  }
}

extension Stripe.Connect.AccountLinks.API {
  public struct Router: ParserPrinter, Sendable {
    public init() {}

    public var body: some URLRouting.Router<Stripe.Connect.AccountLinks.API> {
      OneOf {
        Route(.case(Stripe.Connect.AccountLinks.API.create)) {
          Method.post
          Path.v1
          Path.account_links
          Body(
            .form(
              Stripe.Connect.AccountLinks.Create.Request.self,
              decoder: .stripe,
              encoder: .stripe
            )
          )
        }
      }
    }
  }
}

extension Path<PathBuilder.Component<String>> {
  public static let account_links = Path {
    "account_links"
  }
}
