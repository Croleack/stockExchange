//
//  Deal.swift
//  stockExchange
//
//  Created by Enzhe Gaysina on 27.01.2024.
//

import Foundation

struct Deal {
    let id: Int64
    let dateModifier: Date
    let instrumentName: String
    let price: Double
    let amount: Double
    let side: Side
    
    enum Side: CaseIterable {
	   case sell, buy
    }
}

extension Deal: Equatable {
    static func == (lhs: Deal, rhs: Deal) -> Bool {
	   return lhs.id == rhs.id &&
	   lhs.dateModifier == rhs.dateModifier &&
	   lhs.instrumentName == rhs.instrumentName &&
	   lhs.price == rhs.price &&
	   lhs.amount == rhs.amount &&
	   lhs.side == rhs.side
    }
} 
