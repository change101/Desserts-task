//
//  MealViewModel.swift
//  Fetch-task
//
//  Created by Aleksei Romanov on 10/26/23.
//

import Foundation


class MealViewModel: ObservableObject {
    @Published var meals: [MealModel] = []
    
    func fetchMeals() async {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let mealList = try JSONDecoder().decode(MealList.self, from: data)
            DispatchQueue.main.async {
                self.meals = mealList.meals.sorted(by: { $0.strMeal < $1.strMeal })
            }
        } catch {
            print("Error fetching meals: \(error.localizedDescription)")
        }
    }

}
