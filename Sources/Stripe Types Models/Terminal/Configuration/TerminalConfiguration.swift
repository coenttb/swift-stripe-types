//
//  TerminalConfiguration.swift
//  
//
//  Created by Andrew Edwards on 5/17/23.
//

import Foundation
import Stripe_Types_Shared

// https://docs.stripe.com/api/terminal/configurations/object.md

public struct TerminalConfiguration: Codable, Hashable, Sendable, Identifiable {
    public typealias ID = Tagged<Self, String>
    /// Unique identifier for the object.
    public var id: ID
    /// An object containing device type specific settings for BBPOS WisePOS E
    public var bbposWiseposE: TerminalConfigurationBbposWiseposE?
    /// Whether this Configuration is the default for your account
    public var isAccountDefault: Bool?
    /// On-reader tipping settings
    public var tiping: TerminalConfigurationTipping?
    /// An object containing device type specific settings for Verifone P400
    public var verifoneP400: TerminalConfigurationVerifoneP400?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool

    public init(
        id: ID,
        bbposWiseposE: TerminalConfigurationBbposWiseposE? = nil,
        isAccountDefault: Bool? = nil,
        tiping: TerminalConfigurationTipping? = nil,
        verifoneP400: TerminalConfigurationVerifoneP400? = nil,
        object: String,
        livemode: Bool
    ) {
        self.id = id
        self.bbposWiseposE = bbposWiseposE
        self.isAccountDefault = isAccountDefault
        self.tiping = tiping
        self.verifoneP400 = verifoneP400
        self.object = object
        self.livemode = livemode
    }
}

public struct TerminalConfigurationBbposWiseposE: Codable, Hashable, Sendable {
    /// A File ID representing an image you would like displayed on the reader.
    @ExpandableOf<Stripe.Files.File> public var splashScreen

    public init(
        splashScreen: Stripe.Files.File.ID? = nil
    ) {
        self._splashScreen = Expandable(id: splashScreen)
    }
}

public struct TerminalConfigurationTipping: Codable, Hashable, Sendable {
    /// Tipping configuration for AUD
    public var aud: TerminalConfigurationTippingDetails?
    /// Tipping configuration for CAD
    public var cad: TerminalConfigurationTippingDetails?
    /// Tipping configuration for CHF
    public var chf: TerminalConfigurationTippingDetails?
    /// Tipping configuration for CZK
    public var czk: TerminalConfigurationTippingDetails?
    /// Tipping configuration for DKK
    public var dkk: TerminalConfigurationTippingDetails?
    /// Tipping configuration for EUR
    public var eur: TerminalConfigurationTippingDetails?
    /// Tipping configuration for GBP
    public var gbp: TerminalConfigurationTippingDetails?
    /// Tipping configuration for HKD
    public var hkd: TerminalConfigurationTippingDetails?
    /// Tipping configuration for MYR
    public var myr: TerminalConfigurationTippingDetails?
    /// Tipping configuration for NOK
    public var nok: TerminalConfigurationTippingDetails?
    /// Tipping configuration for NZD
    public var nzd: TerminalConfigurationTippingDetails?
    /// Tipping configuration for SEK
    public var sek: TerminalConfigurationTippingDetails?
    /// Tipping configuration for SGD
    public var sgd: TerminalConfigurationTippingDetails?
    /// Tipping configuration for USD
    public var usd: TerminalConfigurationTippingDetails?

    public init(
        aud: TerminalConfigurationTippingDetails? = nil,
        cad: TerminalConfigurationTippingDetails? = nil,
        chf: TerminalConfigurationTippingDetails? = nil,
        czk: TerminalConfigurationTippingDetails? = nil,
        dkk: TerminalConfigurationTippingDetails? = nil,
        eur: TerminalConfigurationTippingDetails? = nil,
        gbp: TerminalConfigurationTippingDetails? = nil,
        hkd: TerminalConfigurationTippingDetails? = nil,
        myr: TerminalConfigurationTippingDetails? = nil,
        nok: TerminalConfigurationTippingDetails? = nil,
        nzd: TerminalConfigurationTippingDetails? = nil,
        sek: TerminalConfigurationTippingDetails? = nil,
        sgd: TerminalConfigurationTippingDetails? = nil,
        usd: TerminalConfigurationTippingDetails? = nil
    ) {
        self.aud = aud
        self.cad = cad
        self.chf = chf
        self.czk = czk
        self.dkk = dkk
        self.eur = eur
        self.gbp = gbp
        self.hkd = hkd
        self.myr = myr
        self.nok = nok
        self.nzd = nzd
        self.sek = sek
        self.sgd = sgd
        self.usd = usd
    }
}

public struct TerminalConfigurationTippingDetails: Codable, Hashable, Sendable {
    /// Fixed amounts displayed when collecting a tip
    public var fixedAmounts: [Int]?
    /// Percentages displayed when collecting a tip
    public var percentages: [Int]?
    /// Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
    public var smartTipThreshold: Int?

    public init(
        fixedAmounts: [Int]? = nil,
        percentages: [Int]? = nil,
        smartTipThreshold: Int? = nil
    ) {
        self.fixedAmounts = fixedAmounts
        self.percentages = percentages
        self.smartTipThreshold = smartTipThreshold
    }
}

public struct TerminalConfigurationVerifoneP400: Codable, Hashable, Sendable {
    /// A File ID representing an image you would like displayed on the reader.
    @ExpandableOf<Stripe.Files.File> public var splashScreen

    public init(
        splashScreen: Stripe.Files.File.ID? = nil
    ) {
        self._splashScreen = Expandable(id: splashScreen)
    }
}

public struct TerminalConfigurationList: Codable, Hashable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [TerminalConfiguration]?

    public init(
        object: String,
        hasMore: Bool? = nil,
        url: String? = nil,
        data: [TerminalConfiguration]? = nil
    ) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}
