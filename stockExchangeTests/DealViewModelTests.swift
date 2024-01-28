//
//  stockExchangeTests.swift
//  stockExchangeTests
//
//  Created by Enzhe Gaysina on 26.01.2024.
//

import XCTest
import Combine
@testable import stockExchange

class DealViewModelTests: XCTestCase {
    
    var viewModel: DealViewModel!
    var cancellables: Set<AnyCancellable> = []
    let serverStub = ServerStub()
    
    override func setUpWithError() throws {
	  
	   viewModel = DealViewModel()
	   viewModel.server = serverStub
    }
    
    func testSubscribeToDeals() throws {
	   let expectation = XCTestExpectation(description: "Deals updated")

	   viewModel.$sortedDeals
		  .dropFirst()
		  .sink { sortedDeals in
			 XCTAssertEqual(sortedDeals.count, self.serverStub.fakeDeals.count)
			 
			 expectation.fulfill()
		  }
		  .store(in: &cancellables)
	   
	   viewModel.subscribeToDeals()
	   
	   wait(for: [expectation], timeout: 5.0)
    }
}

class ServerStub: Server {
    var fakeDeals: [Deal] = []
    
    override func subscribeToDeals(callback: @escaping ([Deal]) -> Void) {
	   fakeDeals = [
		  Deal(id: 1, dateModifier: Date(), instrumentName: "EUR/USD", price: 63.21, amount: 1000323, side: .buy),
		  Deal(id: 2, dateModifier: Date(), instrumentName: "EUR/USD", price: 65.22, amount: 2000321, side: .sell),
		  Deal(id: 4, dateModifier: Date(), instrumentName: "EUR/USD", price: 67.21, amount: 1000323, side: .buy),
		  Deal(id: 5, dateModifier: Date(), instrumentName: "EUR/USD", price: 68.22, amount: 2000321, side: .sell),
		  Deal(id: 6, dateModifier: Date(), instrumentName: "EUR/USD", price: 69.21, amount: 1000323, side: .buy),
		  Deal(id: 7, dateModifier: Date(), instrumentName: "EUR/USD", price: 60.22, amount: 2000321, side: .sell),
		  Deal(id: 3, dateModifier: Date(), instrumentName: "EUR/USD", price: 68.21, amount: 1000323, side: .buy),
		  Deal(id: 8, dateModifier: Date(), instrumentName: "EUR/USD", price: 69.22, amount: 2000321, side: .sell)
	   ]
	   callback(fakeDeals)
    }
}
