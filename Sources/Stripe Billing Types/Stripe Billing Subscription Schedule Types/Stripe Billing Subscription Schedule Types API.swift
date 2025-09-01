//
//  Stripe Billing Subscription Schedule Types API.swift
//  swift-stripe-types
//
//  Created by Coen ten Thije Boonkkamp on 13/01/2025.
//

import Foundation
import Stripe_Types_Models
import Stripe_Types_Shared
import URLFormCodingURLRouting
import CasePaths
import Tagged

extension Stripe.Billing.SubscriptionSchedule {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        // https://docs.stripe.com/api/subscription_schedules/create.md
        case create(request: Stripe.Billing.SubscriptionSchedule.Create.Request)
        // https://docs.stripe.com/api/subscription_schedules/retrieve.md
        case retrieve(id: Stripe.Billing.Subscription.Schedule.ID)
        // https://docs.stripe.com/api/subscription_schedules/update.md
        case update(id: Stripe.Billing.Subscription.Schedule.ID, request: Stripe.Billing.SubscriptionSchedule.Update.Request)
        // https://docs.stripe.com/api/subscription_schedules/list.md
        case list(request: Stripe.Billing.SubscriptionSchedule.List.Request)
        // https://docs.stripe.com/api/subscription_schedules/cancel.md
        case cancel(id: Stripe.Billing.Subscription.Schedule.ID, request: Stripe.Billing.SubscriptionSchedule.Cancel.Request)
        // https://docs.stripe.com/api/subscription_schedules/release.md
        case release(id: Stripe.Billing.Subscription.Schedule.ID, request: Stripe.Billing.SubscriptionSchedule.Release.Request)
    }
}

extension Stripe.Billing.SubscriptionSchedule.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Stripe.Billing.SubscriptionSchedule.API> {
            OneOf {
                // https://docs.stripe.com/api/subscription_schedules/create.md
                URLRouting.Route(.case(Stripe.Billing.SubscriptionSchedule.API.create)) {
                    Method.post
                    Path.v1
                    Path.subscription_schedules
                    Body(.form(Stripe.Billing.SubscriptionSchedule.Create.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                // https://docs.stripe.com/api/subscription_schedules/retrieve.md
                URLRouting.Route(.case(Stripe.Billing.SubscriptionSchedule.API.retrieve)) {
                    Method.get
                    Path.v1
                    Path.subscription_schedules
                    Path { Parse(.string.representing(Stripe.Billing.Subscription.Schedule.ID.self)) }
                }
                
                // https://docs.stripe.com/api/subscription_schedules/update.md
                URLRouting.Route(.case(Stripe.Billing.SubscriptionSchedule.API.update)) {
                    Method.post
                    Path.v1
                    Path.subscription_schedules
                    Path { Parse(.string.representing(Stripe.Billing.Subscription.Schedule.ID.self)) }
                    Body(.form(Stripe.Billing.SubscriptionSchedule.Update.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                // https://docs.stripe.com/api/subscription_schedules/list.md
                URLRouting.Route(.case(Stripe.Billing.SubscriptionSchedule.API.list)) {
                    Method.get
                    Path.v1
                    Path.subscription_schedules
                    Parse(.memberwise(Stripe.Billing.SubscriptionSchedule.List.Request.init)) {
                        URLRouting.Query {
                            Optionally {
                                Field("canceled_at") { Parse(.string.representing(Stripe.DateFilter.self)) }
                            }
                            Optionally {
                                Field("completed_at") { Parse(.string.representing(Stripe.DateFilter.self)) }
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
                                Field("released_at") { Parse(.string.representing(Stripe.DateFilter.self)) }
                            }
                            Optionally {
                                Field("scheduled") { Bool.parser() }
                            }
                            Optionally {
                                Field("starting_after") { Parse(.string) }
                            }
                        }
                    }
                }
                
                // https://docs.stripe.com/api/subscription_schedules/cancel.md
                URLRouting.Route(.case(Stripe.Billing.SubscriptionSchedule.API.cancel)) {
                    Method.post
                    Path.v1
                    Path.subscription_schedules
                    Path { Parse(.string.representing(Stripe.Billing.Subscription.Schedule.ID.self)) }
                    Path.cancel
                    Body(.form(Stripe.Billing.SubscriptionSchedule.Cancel.Request.self, decoder: .stripe, encoder: .stripe))
                }
                
                // https://docs.stripe.com/api/subscription_schedules/release.md
                URLRouting.Route(.case(Stripe.Billing.SubscriptionSchedule.API.release)) {
                    Method.post
                    Path.v1
                    Path.subscription_schedules
                    Path { Parse(.string.representing(Stripe.Billing.Subscription.Schedule.ID.self)) }
                    Path.release
                    Body(.form(Stripe.Billing.SubscriptionSchedule.Release.Request.self, decoder: .stripe, encoder: .stripe))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let subscription_schedules = Path {
        "subscription_schedules"
    }
    
    nonisolated(unsafe) public static let cancel = Path {
        "cancel"
    }
    
    nonisolated(unsafe) public static let release = Path {
        "release"
    }
}
