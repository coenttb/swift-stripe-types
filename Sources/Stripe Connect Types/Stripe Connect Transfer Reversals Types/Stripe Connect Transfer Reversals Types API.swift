//
//  Stripe Connect Transfer Reversals Types API.swift
//  swift-stripe-types
//
//  Created on 2025-01-14.
//

import CasePaths
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting

extension Stripe.Connect.Transfer.Reversals {
  @CasePathable
  @dynamicMemberLookup
  public enum API: Equatable, Sendable {
    // https://docs.stripe.com/api/transfer_reversals/create.md
    case create(transferId: Stripe.Connect.Transfer.ID, request: Create.Request)
    // https://docs.stripe.com/api/transfer_reversals/retrieve.md
    case retrieve(
      transferId: Stripe.Connect.Transfer.ID,
      reversalId: Stripe.Connect.Transfer.Reversal.ID
    )
    // https://docs.stripe.com/api/transfer_reversals/update.md
    case update(
      transferId: Stripe.Connect.Transfer.ID,
      reversalId: Stripe.Connect.Transfer.Reversal.ID,
      request: Update.Request
    )
    // https://docs.stripe.com/api/transfer_reversals/list.md
    case list(transferId: Stripe.Connect.Transfer.ID, request: List.Request)
  }
}

extension Stripe.Connect.Transfer.Reversals.API {
  public struct Router: ParserPrinter, Sendable {
    public init() {}

    public var body: some URLRouting.Router<Stripe.Connect.Transfer.Reversals.API> {
      OneOf {
        Route(.case(Stripe.Connect.Transfer.Reversals.API.create)) {
          Method.post
          Path.v1
          Path.transfers
          Path { Parse(.string.representing(Stripe.Connect.Transfer.ID.self)) }
          Path { "reversals" }
          Body(
            .form(
              Stripe.Connect.Transfer.Reversals.Create.Request.self,
              decoder: .stripe,
              encoder: .stripe
            )
          )
        }

        Route(.case(Stripe.Connect.Transfer.Reversals.API.retrieve)) {
          Method.get
          Path.v1
          Path.transfers
          Path { Parse(.string.representing(Stripe.Connect.Transfer.ID.self)) }
          Path { "reversals" }
          Path { Parse(.string.representing(Stripe.Connect.Transfer.Reversal.ID.self)) }
        }

        Route(.case(Stripe.Connect.Transfer.Reversals.API.update)) {
          Method.post
          Path.v1
          Path.transfers
          Path { Parse(.string.representing(Stripe.Connect.Transfer.ID.self)) }
          Path { "reversals" }
          Path { Parse(.string.representing(Stripe.Connect.Transfer.Reversal.ID.self)) }
          Body(
            .form(
              Stripe.Connect.Transfer.Reversals.Update.Request.self,
              decoder: .stripe,
              encoder: .stripe
            )
          )
        }

        Route(.case(Stripe.Connect.Transfer.Reversals.API.list)) {
          Method.get
          Path.v1
          Path.transfers
          Path { Parse(.string.representing(Stripe.Connect.Transfer.ID.self)) }
          Path { "reversals" }
          Parse(.memberwise(Stripe.Connect.Transfer.Reversals.List.Request.init)) {
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
