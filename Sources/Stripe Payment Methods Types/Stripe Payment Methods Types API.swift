import CasePaths
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting

extension Stripe.PaymentMethods {
  @CasePathable
  @dynamicMemberLookup
  public enum API: Equatable, Sendable {
    case paymentMethods(Stripe.PaymentMethods.PaymentMethods.API)
    case paymentMethodConfigurations(Stripe.PaymentMethodConfigurations.API)
    case paymentMethodDomains(Stripe.PaymentMethodDomains.API)
    case sources(Stripe.PaymentMethods.Sources.API)
  }
}

extension Stripe.PaymentMethods.API {
  public struct Router: ParserPrinter, Sendable {
    public init() {}

    public var body: some URLRouting.Router<Stripe.PaymentMethods.API> {
      OneOf {
        URLRouting.Route(.case(Stripe.PaymentMethods.API.paymentMethods)) {
          Stripe.PaymentMethods.PaymentMethods.API.Router()
        }

        URLRouting.Route(.case(Stripe.PaymentMethods.API.paymentMethodConfigurations)) {
          Stripe.PaymentMethodConfigurations.API.Router()
        }

        URLRouting.Route(.case(Stripe.PaymentMethods.API.paymentMethodDomains)) {
          Stripe.PaymentMethodDomains.API.Router()
        }

        URLRouting.Route(.case(Stripe.PaymentMethods.API.sources)) {
          Stripe.PaymentMethods.Sources.API.Router()
        }
      }
    }
  }
}

extension Path<PathBuilder.Component<String>> {
  public static let paymentMethods = Path {
    "payment_methods"
  }
}
