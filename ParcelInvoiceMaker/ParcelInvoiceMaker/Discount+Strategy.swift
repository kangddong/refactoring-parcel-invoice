//
//  Discount+Strategy.swift
//  ParcelInvoiceMaker
//
//  Created by 강동영 on 1/26/24.
//

import Foundation

protocol DiscountStrategy {
    func applyDiscount(to deliveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func applyDiscount(to deliveryCost: Int) -> Int {
        return deliveryCost
    }
}

struct VIPDiscount: DiscountStrategy {
    func applyDiscount(to deliveryCost: Int) -> Int {
        return deliveryCost / 5 * 4
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(to deliveryCost: Int) -> Int {
        return deliveryCost / 2
    }
}

enum Discount: Int {
    case none = 0, vip, coupon
    var strategy: DiscountStrategy {
        switch self {
        case .none: return NoDiscount()
        case .vip: return VIPDiscount()
        case .coupon: return CouponDiscount()
        }
    }
}
