//
//  ContentView.swift
//  stockExchange
//
//  Created by Enzhe Gaysina on 26.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = DealViewModel()
    
    var body: some View {
	   VStack(spacing: .zero) {
		  HeaderCell(sorter: $viewModel.sorter)
			 .padding(.init(
				top: Constants.paddingTopHeader,
				leading: .zero,
				bottom: .zero,
				trailing: Constants.paddingTrailingHeader)
			 )
		  
		  ScrollView{
			 LazyVStack(spacing: .zero)  {
				ForEach(viewModel.sortedDeals.reversed(), id: \.id) { model in
				    DealCell(deal: model)
					   .padding(.vertical, Constants.paddingVerticalCell)
				}
			 }
			 .padding(.horizontal, Constants.paddingHorizontCell)
			 .onAppear {
				viewModel.subscribeToDeals()
			 }
		  }
	   }
    }
}

// MARK: - Constants

fileprivate extension ContentView {
    enum Constants {
	   static let paddingTopHeader = 16.0
	   static let paddingTrailingHeader = 16.0
	   static let paddingVerticalCell = 10.0
	   static let paddingHorizontCell = 16.0
    }
}
