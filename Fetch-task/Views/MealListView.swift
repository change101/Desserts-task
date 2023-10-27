//
//  DesertView.swift
//  Fetch-task
//
//  Created by Aleksei Romanov on 10/26/23.
//

import SwiftUI

struct MealListView: View {
    @StateObject var mealViewModel = MealViewModel()

    var body: some View {
        NavigationView {
            List(mealViewModel.meals.sorted { $0.strMeal < $1.strMeal }) { meal in
                Section {
                    MealCellView(meal: meal)
                }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
            }
            .navigationTitle("Desserts")
            .onAppear {
                Task {
                    await mealViewModel.fetchMeals()
                }
            }
        }
    }
}


#Preview {
    MealListView()
}
