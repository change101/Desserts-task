//
//  MealDetailViewModel.swift
//  Fetch-task
//
//  Created by Aleksei Romanov on 10/26/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var mealDetailModel: MealDetailModel?
    @Published var showError: Bool = false
    
    func fetchMealDetail(for id: String) async {
//        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
//        guard let url = URL(string: urlString) else { return }
        
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { return }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self.mealDetailModel = response.meals.first
                    self.showError = false // Assuming data is successfully fetched
                }
            } catch {
                DispatchQueue.main.async {
                    self.mealDetailModel = nil
                    self.showError = true
                }
            }
        }


    private struct Response: Codable {
        let meals: [MealDetailModel]
    }
}
