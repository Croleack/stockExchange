//
//  HeaderCell.swift
//  stockExchange
//
//  Created by Enzhe Gaysina on 27.01.2024.
//

import SwiftUI

struct HeaderCell: View {
    @Binding var sorter: Sorter
    
    var body: some View {
	   GeometryReader { container in
		  HStack(spacing: .zero) {
			 createButton(Constants.buttonDate,
					    field: .date,
					    container: container
			 )
			 createButton(Constants.buttonInst,
					    field: .instrument,
					    container: container
			 )
			 createButton(Constants.buttonPrice,
					    field: .price,
					    container: container
			 )
			 createButton(Constants.buttonAmount,
					    field: .amount,
					    container: container
			 )
			 createButton(Constants.buttonSide,
					    field: .side,
					    container: container
			 )
		  }
		  .foregroundColor(Color.black)
		  .lineLimit(Constants.numberOfLines)
		  .font(.system(size: Constants.fontSystem))
		  .frame(height: Constants.frameHeader, alignment: .center)
	   }
	   .frame(height: Constants.frameHeader)
    }
    // MARK: - func createButton
    private func createButton(_ title: String,
						field: SortField,
						container: GeometryProxy) -> some View {
	   Button(action: {
		  if sorter.field != field {
			 sorter.field = field
		  } else {
			 sorter.direction = sorter.direction == .up ? .down : .up
		  }
	   }) {
		  HStack(spacing: Constants.spacingArrow) {
			 Text(title)
			 if sorter.field == field {
				Image(systemName: sorter.direction == .up ? Constants.up : Constants.down)
				    .resizable()
				    .aspectRatio(contentMode: .fit)
				    .frame(width: Constants.frameArrow,
						 height: Constants.frameArrow,
						 alignment: .center
				    )
			 }
		  }
	   }
	   .font(.system(size: Constants.fontSystem,
				  weight: sorter.field == field ? .bold : .regular)
	   )
	   .frame(width: container.size.width / Constants.columnDivision,
			alignment: .center
	   )
    }
}

// MARK: - Constants

fileprivate extension HeaderCell {
    enum Constants {
	   static let buttonDate = "Date"
	   static let buttonInst = "Instrument"
	   static let buttonPrice = "Price"
	   static let buttonAmount = "Amount"
	   static let buttonSide = "Side"
	   static let up = "arrow.up"
	   static let down = "arrow.down"
	   static let fontSystem = 12.0
	   static let numberOfLines = 1
	   static let frameHeader = 30.0
	   static let frameArrow = 8.0
	   static let columnDivision = 5.0
	   static let spacingArrow = 1.0
    }
}
