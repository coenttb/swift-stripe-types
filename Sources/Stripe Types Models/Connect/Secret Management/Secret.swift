//
//  Secret.swift
//
//
//  Created by Andrew Edwards on 5/18/23.
//

import Foundation
import Stripe_Types_Shared

// https://docs.stripe.com/api/secrets/object.md

extension Stripe.Connect {
  public struct Secret: Codable, Hashable, Sendable, Identifiable {
    public typealias ID = Tagged<Self, String>
    /// Unique identifier for the object.
    public var id: ID
    /// String representing the object's type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// If true, indicates that this secret has been deleted
    public var deleted: Bool?
    /// The Unix timestamp for the expiry time of the secret, after which the secret deletes.
    public var expiresAt: Date?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool
    /// A name for the secret that's unique within the scope.
    public var name: String?
    /// The plaintext secret value to be stored. This field is not included by default. To include it in the response, expand the payload field.
    public var payload: String?
    /// Specifies the scoping of the secret. Requests originating from UI extensions can only access account-scoped secrets or secrets scoped to their own user.
    public var scope: Stripe.Connect.Secret.Scope?

    public init(
      id: ID,
      object: String,
      created: Date,
      deleted: Bool? = nil,
      expiresAt: Date? = nil,
      livemode: Bool,
      name: String? = nil,
      payload: String? = nil,
      scope: Stripe.Connect.Secret.Scope? = nil
    ) {
      self.id = id
      self.object = object
      self.created = created
      self.deleted = deleted
      self.expiresAt = expiresAt
      self.livemode = livemode
      self.name = name
      self.payload = payload
      self.scope = scope
    }
  }
}

extension Stripe.Connect.Secret {
  public struct Scope: Codable, Hashable, Sendable {
    /// The secret scope type.
    public var type: Stripe.Connect.Secret.Scope.`Type`?
    /// The user ID, if type is set to "user"
    public var user: String?

    public init(
      type: Stripe.Connect.Secret.Scope.`Type`? = nil,
      user: String? = nil
    ) {
      self.type = type
      self.user = user
    }
  }
}

extension Stripe.Connect.Secret.Scope {
  public enum `Type`: String, Codable, Sendable {
    /// A secret scoped to a specific user. Use this for oauth tokens or other per-user secrets. If this is set, `scope.user` must also be set.
    case user
    /// A  secret scoped to an account. Use this for API keys or other secrets that should be accessible by all UI Extension contexts.
    case account
  }
}

extension Stripe.Connect.Secret {
  public struct List: Codable, Hashable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [Stripe.Connect.Secret]?

    public init(
      object: String,
      hasMore: Bool? = nil,
      url: String? = nil,
      data: [Stripe.Connect.Secret]? = nil
    ) {
      self.object = object
      self.hasMore = hasMore
      self.url = url
      self.data = data
    }
  }
}
