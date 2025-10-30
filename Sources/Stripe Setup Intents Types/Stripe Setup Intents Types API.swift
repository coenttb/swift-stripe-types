//
//  Stripe Setup Intents Types API.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import CasePaths
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import Tagged
import URLFormCodingURLRouting

extension Stripe.Setup.Intents {
  @CasePathable
  @dynamicMemberLookup
  public enum API: Equatable, Sendable {
    // https://docs.stripe.com/api/setup_intents/create.md
    case create(request: Stripe.Setup.Intents.Create.Request)
    // https://docs.stripe.com/api/setup_intents/retrieve.md
    case retrieve(id: Stripe.Setup.Intent.ID)
    // https://docs.stripe.com/api/setup_intents/update.md
    case update(id: Stripe.Setup.Intent.ID, request: Stripe.Setup.Intents.Update.Request)
    // https://docs.stripe.com/api/setup_intents/list.md
    case list(request: Stripe.Setup.Intents.List.Request)
    // https://docs.stripe.com/api/setup_intents/confirm.md
    case confirm(id: Stripe.Setup.Intent.ID, request: Stripe.Setup.Intents.Confirm.Request)
    // https://docs.stripe.com/api/setup_intents/cancel.md
    case cancel(id: Stripe.Setup.Intent.ID, request: Stripe.Setup.Intents.Cancel.Request)
    // https://docs.stripe.com/api/setup_intents/verify_microdeposits.md
    case verifyMicrodeposits(
      id: Stripe.Setup.Intent.ID,
      request: Stripe.Setup.Intents.VerifyMicrodeposits.Request
    )
  }
}

extension Stripe.Setup.Intents.API {
  public struct Router: ParserPrinter, Sendable {
    public init() {}

    public var body: some URLRouting.Router<Stripe.Setup.Intents.API> {
      OneOf {
        // https://docs.stripe.com/api/setup_intents/create.md
        URLRouting.Route(.case(Stripe.Setup.Intents.API.create)) {
          Method.post
          Path.v1
          Path.setupIntents
          Body(.form(Stripe.Setup.Intents.Create.Request.self, decoder: .stripe, encoder: .stripe))
        }

        // https://docs.stripe.com/api/setup_intents/retrieve.md
        URLRouting.Route(.case(Stripe.Setup.Intents.API.retrieve)) {
          Method.get
          Path.v1
          Path.setupIntents
          Path { Parse(.string.representing(Stripe.Setup.Intent.ID.self)) }
        }

        // https://docs.stripe.com/api/setup_intents/update.md
        URLRouting.Route(.case(Stripe.Setup.Intents.API.update)) {
          Method.post
          Path.v1
          Path.setupIntents
          Path { Parse(.string.representing(Stripe.Setup.Intent.ID.self)) }
          Body(.form(Stripe.Setup.Intents.Update.Request.self, decoder: .stripe, encoder: .stripe))
        }

        // https://docs.stripe.com/api/setup_intents/list.md
        URLRouting.Route(.case(Stripe.Setup.Intents.API.list)) {
          Method.get
          Path.v1
          Path.setupIntents
          Parse(.memberwise(Stripe.Setup.Intents.List.Request.init)) {
            URLRouting.Query {
              Optionally {
                Field("attach_to_self") { Bool.parser() }
              }
              Optionally {
                Field("created") { Parse(.string.representing(Stripe.DateFilter.self)) }
              }
              Optionally {
                Field("customer") { Parse(.string.representing(Stripe.Customers.Customer.ID.self)) }
              }
              Optionally {
                Field("ending_before") { Parse(.string) }
              }
              Optionally {
                Field("limit") { Digits() }
              }
              Optionally {
                Field("payment_method") {
                  Parse(.string.representing(Stripe.PaymentMethods.PaymentMethod.ID.self))
                }
              }
              Optionally {
                Field("starting_after") { Parse(.string) }
              }
            }
          }
        }

        // https://docs.stripe.com/api/setup_intents/confirm.md
        URLRouting.Route(.case(Stripe.Setup.Intents.API.confirm)) {
          Method.post
          Path.v1
          Path.setupIntents
          Path { Parse(.string.representing(Stripe.Setup.Intent.ID.self)) }
          Path { "confirm" }
          Body(.form(Stripe.Setup.Intents.Confirm.Request.self, decoder: .stripe, encoder: .stripe))
        }

        // https://docs.stripe.com/api/setup_intents/cancel.md
        URLRouting.Route(.case(Stripe.Setup.Intents.API.cancel)) {
          Method.post
          Path.v1
          Path.setupIntents
          Path { Parse(.string.representing(Stripe.Setup.Intent.ID.self)) }
          Path { "cancel" }
          Body(.form(Stripe.Setup.Intents.Cancel.Request.self, decoder: .stripe, encoder: .stripe))
        }

        // https://docs.stripe.com/api/setup_intents/verify_microdeposits.md
        URLRouting.Route(.case(Stripe.Setup.Intents.API.verifyMicrodeposits)) {
          Method.post
          Path.v1
          Path.setupIntents
          Path { Parse(.string.representing(Stripe.Setup.Intent.ID.self)) }
          Path { "verify_microdeposits" }
          Body(
            .form(
              Stripe.Setup.Intents.VerifyMicrodeposits.Request.self,
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
  public static let setupIntents = Path {
    "setup_intents"
  }
}
