//
//  Stripe File Links Types API.swift
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

extension Stripe.FileLinks {
  @CasePathable
  @dynamicMemberLookup
  public enum API: Equatable, Sendable {
    // https://docs.stripe.com/api/file_links/create.md
    case create(request: Stripe.FileLinks.Create.Request)
    // https://docs.stripe.com/api/file_links/retrieve.md
    case retrieve(id: Stripe.FileLinks.FileLink.ID)
    // https://docs.stripe.com/api/file_links/update.md
    case update(id: Stripe.FileLinks.FileLink.ID, request: Stripe.FileLinks.Update.Request)
    // https://docs.stripe.com/api/file_links/list.md
    case list(request: Stripe.FileLinks.List.Request)
  }
}

extension Stripe.FileLinks.API {
  public struct Router: ParserPrinter, Sendable {
    public init() {}

    public var body: some URLRouting.Router<Stripe.FileLinks.API> {
      OneOf {
        // https://docs.stripe.com/api/file_links/create.md
        URLRouting.Route(.case(Stripe.FileLinks.API.create)) {
          Method.post
          Path.v1
          Path.fileLinks
          Body(.form(Stripe.FileLinks.Create.Request.self, decoder: .stripe, encoder: .stripe))
        }

        // https://docs.stripe.com/api/file_links/retrieve.md
        URLRouting.Route(.case(Stripe.FileLinks.API.retrieve)) {
          Method.get
          Path.v1
          Path.fileLinks
          Path { Parse(.string.representing(Stripe.FileLinks.FileLink.ID.self)) }
        }

        // https://docs.stripe.com/api/file_links/update.md
        URLRouting.Route(.case(Stripe.FileLinks.API.update)) {
          Method.post
          Path.v1
          Path.fileLinks
          Path { Parse(.string.representing(Stripe.FileLinks.FileLink.ID.self)) }
          Body(.form(Stripe.FileLinks.Update.Request.self, decoder: .stripe, encoder: .stripe))
        }

        // https://docs.stripe.com/api/file_links/list.md
        URLRouting.Route(.case(Stripe.FileLinks.API.list)) {
          Method.get
          Path.v1
          Path.fileLinks
          Parse(.memberwise(Stripe.FileLinks.List.Request.init)) {
            URLRouting.Query {
              Optionally {
                Field("created") { Parse(.string.representing(Stripe.DateFilter.self)) }
              }
              Optionally {
                Field("ending_before") { Parse(.string) }
              }
              Optionally {
                Field("expired") { Bool.parser() }
              }
              Optionally {
                Field("file") { Parse(.string) }
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
  public static let fileLinks = Path {
    "file_links"
  }
}
