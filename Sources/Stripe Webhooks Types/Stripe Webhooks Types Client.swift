import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Webhooks {
  @DependencyClient
  public struct Client: Sendable {
    public var webhookEndpoint: Stripe.WebhookEndpoint.Client = .init()
  }
}
