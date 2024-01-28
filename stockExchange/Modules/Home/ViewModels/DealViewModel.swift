//
//  DealViewModel.swift
//  stockExchange
//
//  Created by Enzhe Gaysina on 27.01.2024.
//

import Foundation
import Combine

class DealViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    @Published var deals: [Deal] = []
    @Published var sortedDeals: [Deal] = []
    @Published var sorter: Sorter = Sorter()
    
    var server = Server()
    
    func subscribeToDeals() {
	   server.subscribeToDeals { newDeals in
		  self.deals.append(contentsOf: newDeals)
		  self.sortedDeals = self.sorter.arraySorting(model: self.deals)
	   }
    }
    
    init() {
	   $sorter
		  .sink { [weak self] _ in
			 self?.sortedDeals = self?.sorter.arraySorting(model: self?.deals ?? []) ?? []
		  }
		  .store(in: &cancellables)
    }
}
