import Foundation
import Testing

@testable import Stripe_Billing_Types
@testable import Stripe_Types_Models

@Suite("List Response Decoding Tests")
struct ListResponseDecodingTests {
    @Test("Should decode list response JSON")
    func decodeListResponse() throws {
        let jsonString = """
            {
              "object": "list",
              "data": [
                {
                  "id": "sub_1RsPLWIWyk7pOzYYUtBL36iN",
                  "object": "subscription",
                  "application": null,
                  "application_fee_percent": null,
                  "automatic_tax": {
                    "disabled_reason": null,
                    "enabled": false,
                    "liability": null
                  },
                  "billing_cycle_anchor": 1754317598,
                  "billing_cycle_anchor_config": null,
                  "billing_mode": {
                    "type": "classic"
                  },
                  "billing_thresholds": null,
                  "cancel_at": null,
                  "cancel_at_period_end": false,
                  "canceled_at": null,
                  "cancellation_details": {
                    "comment": null,
                    "feedback": null,
                    "reason": null
                  },
                  "collection_method": "charge_automatically",
                  "created": 1754317598,
                  "currency": "usd",
                  "current_period_end": 1756995998,
                  "current_period_start": 1754317598,
                  "customer": "cus_So1Oz7jjvC7Bq7",
                  "days_until_due": null,
                  "default_payment_method": null,
                  "default_source": null,
                  "default_tax_rates": [],
                  "description": "Test list subscription 1",
                  "discount": null,
                  "discounts": [],
                  "ended_at": null,
                  "invoice_settings": {
                    "account_tax_ids": null,
                    "issuer": {
                      "type": "self"
                    }
                  },
                  "items": {
                    "object": "list",
                    "data": [
                      {
                        "id": "si_So1OCp5mAG7YYk",
                        "object": "subscription_item",
                        "billing_thresholds": null,
                        "created": 1754317598,
                        "current_period_end": 1756995998,
                        "current_period_start": 1754317598,
                        "discounts": [],
                        "metadata": {},
                        "plan": {
                          "id": "price_1RsPLVIWyk7pOzYYO0JBXqMx",
                          "object": "plan",
                          "active": true,
                          "aggregate_usage": null,
                          "amount": 1500,
                          "amount_decimal": "1500",
                          "billing_scheme": "per_unit",
                          "created": 1754317597,
                          "currency": "usd",
                          "interval": "month",
                          "interval_count": 1,
                          "livemode": false,
                          "metadata": {},
                          "meter": null,
                          "nickname": null,
                          "product": "prod_So1OJm7BYSP2Xb",
                          "tiers_mode": null,
                          "transform_usage": null,
                          "trial_period_days": null,
                          "usage_type": "licensed"
                        },
                        "price": {
                          "id": "price_1RsPLVIWyk7pOzYYO0JBXqMx",
                          "object": "price",
                          "active": true,
                          "billing_scheme": "per_unit",
                          "created": 1754317597,
                          "currency": "usd",
                          "custom_unit_amount": null,
                          "livemode": false,
                          "lookup_key": null,
                          "metadata": {},
                          "nickname": null,
                          "product": "prod_So1OJm7BYSP2Xb",
                          "recurring": {
                            "aggregate_usage": null,
                            "interval": "month",
                            "interval_count": 1,
                            "meter": null,
                            "trial_period_days": null,
                            "usage_type": "licensed"
                          },
                          "tax_behavior": "unspecified",
                          "tiers_mode": null,
                          "transform_quantity": null,
                          "type": "recurring",
                          "unit_amount": 1500,
                          "unit_amount_decimal": "1500"
                        },
                        "quantity": 1,
                        "subscription": "sub_1RsPLWIWyk7pOzYYUtBL36iN",
                        "tax_rates": []
                      }
                    ],
                    "has_more": false,
                    "total_count": 1,
                    "url": "/v1/subscription_items?subscription=sub_1RsPLWIWyk7pOzYYUtBL36iN"
                  },
                  "latest_invoice": "in_1RsPLWIWyk7pOzYY4pf2T3Ve",
                  "livemode": false,
                  "metadata": {},
                  "next_pending_invoice_item_invoice": null,
                  "on_behalf_of": null,
                  "pause_collection": null,
                  "payment_settings": {
                    "payment_method_options": null,
                    "payment_method_types": null,
                    "save_default_payment_method": "off"
                  },
                  "pending_invoice_item_interval": null,
                  "pending_setup_intent": null,
                  "pending_update": null,
                  "plan": {
                    "id": "price_1RsPLVIWyk7pOzYYO0JBXqMx",
                    "object": "plan",
                    "active": true,
                    "aggregate_usage": null,
                    "amount": 1500,
                    "amount_decimal": "1500",
                    "billing_scheme": "per_unit",
                    "created": 1754317597,
                    "currency": "usd",
                    "interval": "month",
                    "interval_count": 1,
                    "livemode": false,
                    "metadata": {},
                    "meter": null,
                    "nickname": null,
                    "product": "prod_So1OJm7BYSP2Xb",
                    "tiers_mode": null,
                    "transform_usage": null,
                    "trial_period_days": null,
                    "usage_type": "licensed"
                  },
                  "quantity": 1,
                  "schedule": null,
                  "start_date": 1754317598,
                  "status": "incomplete",
                  "test_clock": null,
                  "transfer_data": null,
                  "trial_end": null,
                  "trial_settings": {
                    "end_behavior": {
                      "missing_payment_method": "create_invoice"
                    }
                  },
                  "trial_start": null
                }
              ],
              "has_more": false,
              "url": "/v1/subscriptions"
            }
            """

        let data = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        do {
            let response = try decoder.decode(
                Stripe.Billing.Subscriptions.List.Response.self,
                from: data
            )
            #expect(response.object == "list")
            #expect(response.data.count == 1)
            #expect(response.hasMore == false)
            #expect(response.url == "/v1/subscriptions")

            if let subscription = response.data.first {
                #expect(subscription.id == "sub_1RsPLWIWyk7pOzYYUtBL36iN")
                #expect(subscription.status == .incomplete)
            }
        } catch {
            print("Decoding error: \(error)")
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .keyNotFound(let key, let context):
                    print("Key not found: \(key.stringValue)")
                    print("Context: \(context.debugDescription)")
                    print(
                        "Coding path: \(context.codingPath.map { $0.stringValue }.joined(separator: " -> "))"
                    )
                case .typeMismatch(let type, let context):
                    print("Type mismatch: \(type)")
                    print("Context: \(context.debugDescription)")
                    print(
                        "Coding path: \(context.codingPath.map { $0.stringValue }.joined(separator: " -> "))"
                    )
                case .valueNotFound(let type, let context):
                    print("Value not found: \(type)")
                    print("Context: \(context.debugDescription)")
                    print(
                        "Coding path: \(context.codingPath.map { $0.stringValue }.joined(separator: " -> "))"
                    )
                case .dataCorrupted(let context):
                    print("Data corrupted: \(context.debugDescription)")
                    print(
                        "Coding path: \(context.codingPath.map { $0.stringValue }.joined(separator: " -> "))"
                    )
                @unknown default:
                    print("Unknown decoding error")
                }
            }
            throw error
        }
    }
}
