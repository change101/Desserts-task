//
//  MealModel.swift
//  Fetch-task
//
//  Created by Aleksei Romanov on 10/25/23.
//

import Foundation

struct MealList: Decodable {
    let meals: [MealModel]
}

struct MealModel: Decodable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    var id: String {
        return idMeal
    }
}


