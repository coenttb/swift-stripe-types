import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Products.PromotionCodes {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/promotion_codes/create.md
    @DependencyEndpoint
    public var create: @Sendable (_ request: Create.Request) async throws -> Promotion.Code

    // https://docs.stripe.com/api/promotion_codes/retrieve.md
    @DependencyEndpoint
    public var retrieve: @Sendable (_ id: Promotion.Code.ID) async throws -> Promotion.Code

    // https://docs.stripe.com/api/promotion_codes/update.md
    @DependencyEndpoint
    public var update:
      @Sendable (_ id: Promotion.Code.ID, _ request: Update.Request) async throws -> Promotion.Code

    // https://docs.stripe.com/api/promotion_codes/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: List.Request) async throws -> List.Response
  }
}
