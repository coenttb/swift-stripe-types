import Dependencies
import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared

extension Stripe.Terminal.Readers {
  @DependencyClient
  public struct Client: Sendable {
    // https://docs.stripe.com/api/terminal/readers/create.md
    @DependencyEndpoint
    public var create: @Sendable (_ request: Create.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/retrieve.md
    @DependencyEndpoint
    public var retrieve: @Sendable (_ id: Reader.ID) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/update.md
    @DependencyEndpoint
    public var update: @Sendable (_ id: Reader.ID, _ request: Update.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/list.md
    @DependencyEndpoint
    public var list: @Sendable (_ request: List.Request) async throws -> List.Response

    // https://docs.stripe.com/api/terminal/readers/delete.md
    @DependencyEndpoint
    public var delete: @Sendable (_ id: Reader.ID) async throws -> DeletedObject<Reader>

    // https://docs.stripe.com/api/terminal/readers/cancel_action.md
    @DependencyEndpoint
    public var cancelAction: @Sendable (_ id: Reader.ID) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/process_payment_intent.md
    @DependencyEndpoint
    public var processPaymentIntent:
      @Sendable (_ id: Reader.ID, _ request: ProcessPaymentIntent.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/process_setup_intent.md
    @DependencyEndpoint
    public var processSetupIntent:
      @Sendable (_ id: Reader.ID, _ request: ProcessSetupIntent.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/collect_inputs.md
    @DependencyEndpoint
    public var collectInputs:
      @Sendable (_ id: Reader.ID, _ request: CollectInputs.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/confirm_payment_intent.md
    @DependencyEndpoint
    public var confirmPaymentIntent:
      @Sendable (_ id: Reader.ID, _ request: ConfirmPaymentIntent.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/collect_payment_method.md
    @DependencyEndpoint
    public var collectPaymentMethod:
      @Sendable (_ id: Reader.ID, _ request: CollectPaymentMethod.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/refund_payment.md
    @DependencyEndpoint
    public var refundPayment:
      @Sendable (_ id: Reader.ID, _ request: RefundPayment.Request) async throws -> Reader

    // https://docs.stripe.com/api/terminal/readers/set_reader_display.md
    @DependencyEndpoint
    public var setReaderDisplay:
      @Sendable (_ id: Reader.ID, _ request: SetReaderDisplay.Request) async throws -> Reader

    // https://docs.stripe.com/api/test_helpers/terminal/readers/present_payment_method.md
    @DependencyEndpoint
    public var presentPaymentMethod:
      @Sendable (_ id: Reader.ID, _ request: PresentPaymentMethod.Request) async throws -> Reader
  }
}
