//
//  MealCellView.swift
//  Fetch-task
//
//  Created by Aleksei Romanov on 10/26/23.
//

import SwiftUI

struct MealCellView: View {
    let meal: MealModel

    var body: some View {
        NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
            ZStack(alignment: .bottom) {
                if let url = URL(string: meal.strMealThumb) {
                    AsyncImage(url: url) { image in
                        switch image {
                        case .empty:
                            ProgressView()
                        case .success(let returnedImage):
                            returnedImage
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        case .failure:
                            ProgressView()
                        @unknown default:
                            Image(systemName: "questionmark")
                        }
                    }
                    .frame(height: 160)
                }
                ScrollView (.horizontal) {
                    Text(meal.strMeal)
                        .frame(height: 30)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                        .padding(.leading)
                }
                .background(.thinMaterial)
            }
        }
    }
}
