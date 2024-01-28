//
//  DealSorter.swift
//  stockExchange
//
//  Created by Enzhe Gaysina on 26.01.2024.
//

import Foundation

enum SortField: String, CaseIterable {
    case date, instrument, price, amount, side
}

enum SortDirection: String, CaseIterable {
    case up, down
}

struct Sorter {
    var field: SortField = .date
    var direction: SortDirection = .down
    
    func arraySorting(model: [Deal], new: [Deal] = []) -> [Deal] {
	   var total: [Deal] = model
	   
	   if !new.isEmpty {
		  total.append(contentsOf: new)
	   }
	   switch self.direction {
		  
	   case .down:
		  switch self.field {
		  case .date: return total.sorted(by: { $0.dateModifier > $1.dateModifier })
		  case .side: return total.sorted(by: { ($0.side == .sell ? 0 : 1) > ($1.side == .sell ? 0 : 1) })
		  case .price: return total.sorted(by: { $0.price > $1.price })
		  case .amount: return total.sorted(by: { $0.amount > $1.amount })
		  case .instrument: return total.sorted(by: { $0.instrumentName > $1.instrumentName })
		  }
	   case .up:
		  switch self.field {
		  case .date: return total.sorted(by: { $0.dateModifier < $1.dateModifier })
		  case .side: return total.sorted(by: { ($0.side == .sell ? 0 : 1) < ($1.side == .sell ? 0 : 1) })
		  case .price: return total.sorted(by: { $0.price < $1.price })
		  case .amount: return total.sorted(by: { $0.amount < $1.amount })
		  case .instrument: return total.sorted(by: { $0.instrumentName < $1.instrumentName })
		  }
	   }
    }
    func reorder(model: [Deal]) -> [Deal] {
	   return model.reversed()
    }
}
