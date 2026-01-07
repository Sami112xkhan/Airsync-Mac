//
//  LicensePlanType.swift
//  AirSync
//
//  Created by Sameera on 2025-08-23.
//

import Foundation

/// Represents which paid plan the user selected before activating a license.
/// Stored in UserDefaults via the `licensePlanType` key so the verification
/// Choose the correct Gumroad product id.
enum LicensePlanType: String, CaseIterable, Codable, Identifiable {
    case monthly
    case yearly
    case lifetime
    #if SELF_COMPILED
    case selfCompiled
    #endif

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .monthly: return "Monthly - $1"
        case .yearly: return "Yearly - $10"
        case .lifetime: return "Lifetime - $12"
        #if SELF_COMPILED
        case .selfCompiled: return "Self-Compiled"
        #endif
        }
    }
}

extension UserDefaults {
    private static let licensePlanTypeKey = "licensePlanType"

    var licensePlanType: LicensePlanType {
        get { LicensePlanType(rawValue: string(forKey: Self.licensePlanTypeKey) ?? "") ?? .monthly }
        set { set(newValue.rawValue, forKey: Self.licensePlanTypeKey) }
    }
}
