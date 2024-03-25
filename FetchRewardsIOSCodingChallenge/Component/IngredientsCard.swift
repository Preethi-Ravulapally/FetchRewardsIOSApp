
import SwiftUI

struct IngredientsCard: View {
    @EnvironmentObject var mealModel: MealContentViewModel
    @Environment(\.dismiss) var dismiss
    var selectedMealId: String

    var body: some View {
        VStack {
            NavigationView {
                if mealModel.ingredients.meals.count > 0 {
                    let ingredientList = mealModel.ingredients.meals[0]
                    ScrollView(showsIndicators: false) {
                        VStack {
                            if mealModel.getImage(mealName: ingredientList.strMeal) == nil {
                                let imageURL = URL(string: ingredientList.strMealThumb)
                                AsyncImage(url: imageURL) { image in
                                    switch image {
                                    case .success(let img):
                                        img
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxHeight: 400)
                                            .padding(10)
                                    case .failure(_):
                                        Text("error in loading image")
                                    case .empty:
                                        ProgressView()
                                    @unknown default:
                                        ProgressView()
                                    }
                                }
                            }
                            else {
                                Image(uiImage: mealModel.getImage(mealName: ingredientList.strMeal)!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 400)
                                    .padding(10)
                            }
                        }
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Instructions:")
                                    .font(.title3).bold()
                                    .padding(.vertical, 5)
                                Text(ingredientList.strInstructions)
                                    .font(.body)
                                    .opacity(0.8)
                                    
                            }
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding()
                            
                            VStack(alignment: .leading) {
                                Text("Ingredients:")
                                    .font(.title3).bold()
                                    .padding(.horizontal)
                                    
                                ScrollView(.horizontal, showsIndicators: false){
                                    LazyHStack(spacing: -20) {
                                        let measuments = ingredientList.measurement
                                        let ingredient = ingredientList.ingedients
                                        ForEach(Array(ingredient.indices), id: \.self) { index in
                                                if !ingredient[index].isEmpty , !measuments[index].isEmpty {
                                                    Text("\(measuments[index]) \(ingredient[index])")
                                                        .padding(10)
                                                        .background(.ultraThinMaterial)
                                                        .cornerRadius(5)
                                                }
                                            }
                                            .padding(.horizontal)
                                    }
                                    
                                }
                                .frame(height: 100)
                            }
                        }
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                    }
                    .toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            Text(ingredientList.strMeal)
                                .font(.largeTitle.bold())
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    })
                    .background(.ultraThinMaterial)
                    .navigationBarItems(trailing: Image(systemName: "xmark.circle.fill")
                        .onTapGesture {
                            dismiss()
                        }
                    )
                }
            }
        }
        .padding(.horizontal, 10)
        .task {
            mealModel.fetchIngredientsFromMeal(mealId: selectedMealId) { status in
                if status {
                    mealModel.errorMessage = ""
                }
                else {
                    mealModel.errorMessage = "Error in getting instructions and ingredients of a Meal"
                }
            }
        }
    }
    
}
