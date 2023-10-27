//
//  MealDetailView.swift
//  Fetch-task
//
//  Created by Aleksei Romanov on 10/25/23.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @StateObject var mealDetailViewModel = MealDetailViewModel()
    @State private var showError: Bool = false

    
    var body: some View {
        List {
            if let detail = mealDetailViewModel.mealDetailModel {
                Section {
                    if let url = URL(string: detail.strMealThumb ?? "") {
                        AsyncImage(url: url) { image in
                            switch image {
                            case .empty:
                                ProgressView()
                                    .frame(height: 160)
                            case .success(let returnedImage):
                                returnedImage
                                    .resizable()
                                    .scaledToFill()
                            case .failure:
                                ProgressView()
                                    .frame(height: 160)
                            @unknown default:
                                Image(systemName: "questionmark")
                                    .frame(height: 160)
                            }
                        }
                        .frame(height: 260)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                
                Section {
                    Text("Instructions:")
                        .font(.headline)
                    Text(detail.strInstructions ?? "")
                        .padding(.vertical)
                }
                
                Section {
                    Text("Ingredients:")
                        .font(.headline)
                    
                    ForEach(0..<20, id: \.self) { index in
                        let ingredient = self.ingredient(at: index, in: detail)
                        let measure = self.measure(at: index, in: detail)
                        
                        if !(ingredient?.isEmpty ?? true) {
                            HStack {
                                Text("\(ingredient!)")
                                Spacer()
                                Text("\(measure ?? "")")
                                    .fontWeight(.semibold)
                            }
                            .padding(.trailing, 20)
                        }
                    }
                }
                
            } else if showError {
                //Error display
                VStack (alignment: .center) {
                    Text("😔")
                        .font(.title)
                        .padding(.bottom, 30)
                    Text("We've experienced an error. Please try to relaunch the app. If the error persists, contact the support.")
                        .foregroundStyle(Color.primary)
                        .multilineTextAlignment(.center)
                }
                .padding(40)
            }
        }
        .navigationBarTitle(mealDetailViewModel.mealDetailModel?.strMeal ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                   await mealDetailViewModel.fetchMealDetail(for: mealID)
               }
            // Introduce a delay and then check if there's data
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if mealDetailViewModel.mealDetailModel == nil {
                    self.showError = true
                }
            }
        }

        
    

        
    }
    
    func ingredient(at index: Int, in detail: MealDetailModel) -> String? {
        switch index {
        case 0: return detail.strIngredient1
        case 1: return detail.strIngredient2
        case 2: return detail.strIngredient3
        case 3: return detail.strIngredient4
        case 4: return detail.strIngredient5
        case 5: return detail.strIngredient6
        case 6: return detail.strIngredient7
        case 7: return detail.strIngredient8
        case 8: return detail.strIngredient9
        case 9: return detail.strIngredient10
        case 10: return detail.strIngredient11
        case 11: return detail.strIngredient12
        case 12: return detail.strIngredient13
        case 13: return detail.strIngredient14
        case 14: return detail.strIngredient15
        case 15: return detail.strIngredient16
        case 16: return detail.strIngredient17
        case 17: return detail.strIngredient18
        case 18: return detail.strIngredient19
        case 19: return detail.strIngredient20
        default: return nil
        }
    }
    
    func measure(at index: Int, in detail: MealDetailModel) -> String? {
        switch index {
        case 0: return detail.strMeasure1
        case 1: return detail.strMeasure2
        case 2: return detail.strMeasure3
        case 3: return detail.strMeasure4
        case 4: return detail.strMeasure5
        case 5: return detail.strMeasure6
        case 6: return detail.strMeasure7
        case 7: return detail.strMeasure8
        case 8: return detail.strMeasure9
        case 9: return detail.strMeasure10
        case 10: return detail.strMeasure11
        case 11: return detail.strMeasure12
        case 12: return detail.strMeasure13
        case 13: return detail.strMeasure14
        case 14: return detail.strMeasure15
        case 15: return detail.strMeasure16
        case 16: return detail.strMeasure17
        case 17: return detail.strMeasure18
        case 18: return detail.strMeasure19
        case 19: return detail.strMeasure20
        default: return nil
        }
    }
}
