import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import URLRouting
import CasePaths
import Tagged

extension Stripe.Terminal.Readers {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/terminal/readers/create.md
        case create(request: Create.Request)
        // https://docs.stripe.com/api/terminal/readers/retrieve.md
        case retrieve(id: Reader.ID)
        // https://docs.stripe.com/api/terminal/readers/update.md
        case update(id: Reader.ID, request: Update.Request)
        // https://docs.stripe.com/api/terminal/readers/list.md
        case list(request: List.Request)
        // https://docs.stripe.com/api/terminal/readers/delete.md
        case delete(id: Reader.ID)
        // https://docs.stripe.com/api/terminal/readers/cancel_action.md
        case cancelAction(id: Reader.ID)
        // https://docs.stripe.com/api/terminal/readers/process_payment_intent.md
        case processPaymentIntent(id: Reader.ID, request: ProcessPaymentIntent.Request)
        // https://docs.stripe.com/api/terminal/readers/process_setup_intent.md
        case processSetupIntent(id: Reader.ID, request: ProcessSetupIntent.Request)
        // https://docs.stripe.com/api/terminal/readers/collect_inputs.md
        case collectInputs(id: Reader.ID, request: CollectInputs.Request)
        // https://docs.stripe.com/api/terminal/readers/confirm_payment_intent.md
        case confirmPaymentIntent(id: Reader.ID, request: ConfirmPaymentIntent.Request)
        // https://docs.stripe.com/api/terminal/readers/collect_payment_method.md
        case collectPaymentMethod(id: Reader.ID, request: CollectPaymentMethod.Request)
        // https://docs.stripe.com/api/terminal/readers/refund_payment.md
        case refundPayment(id: Reader.ID, request: RefundPayment.Request)
        // https://docs.stripe.com/api/terminal/readers/set_reader_display.md
        case setReaderDisplay(id: Reader.ID, request: SetReaderDisplay.Request)
        // https://docs.stripe.com/api/test_helpers/terminal/readers/present_payment_method.md
        case presentPaymentMethod(id: Reader.ID, request: PresentPaymentMethod.Request)
    }
}

extension Stripe.Terminal.Readers.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Terminal.Readers.API> {
            OneOf {
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.create)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Body(.form(Stripe.Terminal.Readers.Create.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.retrieve)) {
                    Method.get
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.update)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Body(.form(Stripe.Terminal.Readers.Update.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                // TODO: Fix list route query parameter parsing
                // URLRouting.Route(.case(Stripe.Terminal.Readers.API.list)) {
                //     Method.get
                //     Path.v1
                //     Path.terminal
                //     Path.readers
                // }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.delete)) {
                    Method.delete
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.cancelAction)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.cancelAction
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.processPaymentIntent)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.processPaymentIntent
                    Body(.form(Stripe.Terminal.Readers.ProcessPaymentIntent.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.processSetupIntent)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.processSetupIntent
                    Body(.form(Stripe.Terminal.Readers.ProcessSetupIntent.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.collectInputs)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.collectInputs
                    Body(.form(Stripe.Terminal.Readers.CollectInputs.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.confirmPaymentIntent)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.confirmPaymentIntent
                    Body(.form(Stripe.Terminal.Readers.ConfirmPaymentIntent.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.collectPaymentMethod)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.collectPaymentMethod
                    Body(.form(Stripe.Terminal.Readers.CollectPaymentMethod.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.refundPayment)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.refundPayment
                    Body(.form(Stripe.Terminal.Readers.RefundPayment.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.setReaderDisplay)) {
                    Method.post
                    Path.v1
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.setReaderDisplay
                    Body(.form(Stripe.Terminal.Readers.SetReaderDisplay.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                URLRouting.Route(.case(Stripe.Terminal.Readers.API.presentPaymentMethod)) {
                    Method.post
                    Path.v1
                    Path.testHelpers
                    Path.terminal
                    Path.readers
                    Path { Parse(.string.representing(Stripe.Terminal.Readers.Reader.ID.self)) }
                    Path.presentPaymentMethod
                    Body(.form(Stripe.Terminal.Readers.PresentPaymentMethod.Request.self, decoder: .stripe, encoder: .stripe))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    public static let terminal = Path {
        "terminal"
    }
    
    public static let readers = Path {
        "readers"
    }
    
    public static let cancelAction = Path {
        "cancel_action"
    }
    
    public static let processPaymentIntent = Path {
        "process_payment_intent"
    }
    
    public static let processSetupIntent = Path {
        "process_setup_intent"
    }
    
    public static let collectInputs = Path {
        "collect_inputs"
    }
    
    public static let confirmPaymentIntent = Path {
        "confirm_payment_intent"
    }
    
    public static let collectPaymentMethod = Path {
        "collect_payment_method"
    }
    
    public static let refundPayment = Path {
        "refund_payment"
    }
    
    public static let setReaderDisplay = Path {
        "set_reader_display"
    }
    
    public static let testHelpers = Path {
        "test_helpers"
    }
    
    public static let presentPaymentMethod = Path {
        "present_payment_method"
    }
}
