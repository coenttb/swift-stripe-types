import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Capital.FinancingOffer {
  // https://docs.stripe.com/api/capital/financing_offers/list.md
  public enum List {}
}

extension Stripe.Capital.FinancingOffer.List {
  public struct Request: Codable, Equatable, Sendable {
    public let connectedAccount: String?
    public let created: Stripe.DateFilter?
    public let endingBefore: String?
    public let limit: Int
    public let startingAfter: String?
    public let status: String?

    public init(
      connectedAccount: String? = nil,
      created: Stripe.DateFilter? = nil,
      status: String? = nil,
      limit: Int = 10,
      startingAfter: String? = nil,
      endingBefore: String? = nil
    ) {
      self.connectedAccount = connectedAccount
      self.created = created
      self.status = status
      self.limit = limit
      self.startingAfter = startingAfter
      self.endingBefore = endingBefore
    }

    private enum CodingKeys: String, CodingKey {
      case connectedAccount = "connected_account"
      case created
      case endingBefore = "ending_before"
      case limit
      case startingAfter = "starting_after"
      case status
    }
  }

  public struct Response: Codable, Sendable {
    public let object: String
    public let url: String
    public let hasMore: Bool
    public let data: [Stripe.Capital.FinancingOffer]

    private enum CodingKeys: String, CodingKey {
      case object
      case url
      case hasMore = "has_more"
      case data
    }
  }
}
