import Testing
@testable import Stripe_Web_Elements_Types

@Test func testWebElementsNamespace() {
    // Test that the WebElements namespace exists
    _ = Stripe.WebElements.self
}

@Test func testPaymentElementInitialization() {
    let payment = Stripe.WebElements.Payment()
    #expect(payment.options == nil)
    
    let paymentWithOptions = Stripe.WebElements.Payment(
        options: .init(
            layout: .init(type: .accordion),
            readOnly: false
        )
    )
    #expect(paymentWithOptions.options != nil)
    #expect(paymentWithOptions.options?.layout?.type == .accordion)
}

@Test func testExpressCheckoutElementInitialization() {
    let expressCheckout = Stripe.WebElements.ExpressCheckout()
    #expect(expressCheckout.options == nil)
    
    let expressCheckoutWithOptions = Stripe.WebElements.ExpressCheckout(
        options: .init(
            buttonTheme: .black,
            buttonType: .checkout
        )
    )
    #expect(expressCheckoutWithOptions.options != nil)
    #expect(expressCheckoutWithOptions.options?.buttonTheme == .black)
}

@Test func testAddressElementInitialization() {
    let address = Stripe.WebElements.Address()
    #expect(address.options == nil)
    
    let addressWithOptions = Stripe.WebElements.Address(
        options: .init(
            mode: .billing
        )
    )
    #expect(addressWithOptions.options != nil)
    #expect(addressWithOptions.options?.mode == .billing)
}

@Test func testCurrencySelectorElementInitialization() {
    let currencySelector = Stripe.WebElements.CurrencySelector()
    #expect(currencySelector.options == nil)
    
    let currencySelectorWithOptions = Stripe.WebElements.CurrencySelector(
        options: .init(
            defaultCurrency: "USD",
            supportedCurrencies: ["USD", "EUR", "GBP"]
        )
    )
    #expect(currencySelectorWithOptions.options != nil)
    #expect(currencySelectorWithOptions.options?.defaultCurrency == "USD")
}

@Test func testLinkAuthenticationElementInitialization() {
    let linkAuth = Stripe.WebElements.LinkAuthentication()
    #expect(linkAuth.options == nil)
    
    let linkAuthWithOptions = Stripe.WebElements.LinkAuthentication(
        options: .init(
            defaultValues: .init(email: "test@example.com")
        )
    )
    #expect(linkAuthWithOptions.options != nil)
    #expect(linkAuthWithOptions.options?.defaultValues?.email == "test@example.com")
}

@Test func testPaymentMethodMessagingElementInitialization() {
    let messaging = Stripe.WebElements.PaymentMethodMessaging()
    #expect(messaging.options == nil)
    
    let messagingWithOptions = Stripe.WebElements.PaymentMethodMessaging(
        options: .init(
            amount: 1000,
            currency: .usd,
            displayType: .promotional
        )
    )
    #expect(messagingWithOptions.options != nil)
    #expect(messagingWithOptions.options?.amount == 1000)
}

@Test func testTaxIDElementInitialization() {
    let taxID = Stripe.WebElements.TaxID()
    #expect(taxID.options == nil)
    
    let taxIDWithOptions = Stripe.WebElements.TaxID(
        options: .init(
            defaultCountry: "US"
        )
    )
    #expect(taxIDWithOptions.options != nil)
    #expect(taxIDWithOptions.options?.defaultCountry == "US")
}