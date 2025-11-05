import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Products.Coupons {
    @DependencyClient
    public struct Client: Sendable {
        // https://docs.stripe.com/api/coupons/create.md
        @DependencyEndpoint
        public var create:
            @Sendable (_ request: Create.Request) async throws -> Stripe.Products.Coupon

        // https://docs.stripe.com/api/coupons/update.md
        @DependencyEndpoint
        public var update:
            @Sendable (_ id: Stripe.Products.Coupon.ID, _ request: Update.Request) async throws ->
                Stripe.Products.Coupon

        // https://docs.stripe.com/api/coupons/retrieve.md
        @DependencyEndpoint
        public var retrieve:
            @Sendable (_ id: Stripe.Products.Coupon.ID) async throws -> Stripe.Products.Coupon

        // https://docs.stripe.com/api/coupons/list.md
        @DependencyEndpoint
        public var list: @Sendable (_ request: List.Request) async throws -> List.Response

        // https://docs.stripe.com/api/coupons/delete.md
        @DependencyEndpoint
        public var delete:
            @Sendable (_ id: Stripe.Products.Coupon.ID) async throws -> DeletedObject<
                Stripe.Products.Coupon
            >
    }
}
