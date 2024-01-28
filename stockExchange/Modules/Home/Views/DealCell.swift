//
//  DealCell.swift
//  stockExchange
//
//  Created by Enzhe Gaysina on 27.01.2024.
//

import SwiftUI

struct DealCell: View {
    var deal: Deal
    
    private let dateFormatter: DateFormatter = {
	   let formatter = DateFormatter()
	   formatter.dateFormat = Constants.dateFormate
	   return formatter
    }()
    
    private let columnWidth: CGFloat = {
	   return UIScreen.main.bounds.width / Constants.columnDivision
    }()
    //MARK: - body View
    var body: some View {
	   GeometryReader { container in
		  VStack(alignment: .leading,
			    spacing: .zero) {
			 Text(dateFormatter.string(from: deal.dateModifier))
				.font(.system(size: Constants.fontTextDate))
				.foregroundColor(Color.gray)
				.padding(.bottom, Constants.paddingBottomTextDate)
			 HStack(spacing: .zero){
				let sell = deal.side == Deal.Side.sell
				Text(deal.instrumentName.split(separator: Constants.separator)[.zero])
				    .frame(width: columnWidth)
				    .padding(.trailing, Constants.paddingTrailTextInst)
				Text("\(deal.price, specifier: Constants.priceRounding)")
				    .frame(width: columnWidth)
				Text("\(deal.amount, specifier: Constants.amountRounding)")
				    .frame(width: columnWidth)
				    .padding(.trailing, Constants.paddingTrailTextAmount)
				Text(sell ? Constants.sell : Constants.buy)
				    .frame(width: columnWidth)
				    .foregroundColor(sell ? Color.red : Color.green)
			 }
			 .font(.system(size: Constants.fontText))
			 .scaledToFill()
			 .lineLimit(Constants.numberOfLines)
			 .minimumScaleFactor(Constants.scaleFactor)
		  }
			    .frame(height: Constants.heightCell,
					 alignment: .center)
	   }
	   .frame(height: Constants.heightCell)
    }
}

// MARK: - Constants

fileprivate extension DealCell {
    enum Constants {
	   static let dateFormate = "HH:mm:ss dd.MM.yyyy"
	   static let separator = "_"
	   static let priceRounding = "%.2f"
	   static let amountRounding = "%.0f"
	   static let sell = "Sell"
	   static let buy = "Buy"
	   static let columnDivision = 4.0
	   static let fontTextDate = 13.0
	   static let fontText = 17.0
	   static let numberOfLines = 1
	   static let scaleFactor = 0.1
	   static let heightCell = 40.0
	   static let paddingBottomTextDate = 10.0
	   static let paddingTrailTextInst = 11.0
	   static let paddingTrailTextAmount = -24.0
    }
}
