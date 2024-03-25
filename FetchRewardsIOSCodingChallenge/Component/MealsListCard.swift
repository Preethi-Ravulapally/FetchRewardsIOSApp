
import SwiftUI

struct MealsListCard: View {
    @EnvironmentObject var mealModel: MealContentViewModel
    var mealList: MealsList
    
    var body: some View {
        VStack() {
            if !mealList.strMeal.isEmpty {
                HStack {
                    if mealModel.getImage(mealName: mealList.strMeal) == nil {
                        let imageURL = URL(string: mealList.strMealThumb)
                        AsyncImage(url: imageURL, scale: 3) { image in
                            switch image {
                            case .success(let img):
                                img
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 400)
                                    .padding(10)
                                    .padding(.horizontal)
                            case .failure(_):
                                Text("error in loading image")
                            case .empty:
                                ProgressView()
                            @unknown default:
                                ProgressView()
                            }
                        }
                        .cornerRadius(15)
                    }
                    else {
                        Image(uiImage: mealModel.getImage(mealName: mealList.strMeal)!)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 400)
                            .padding(10)
                            .padding(.horizontal)
                            .cornerRadius(15)
                    }
                    HStack(spacing: 7) {
                        Text(mealList.strMeal)
                            .font(.headline)
                            .fontWidth(.expanded)
                            .padding(.horizontal)
                    }
                    
                }
            }
        }
    }
    
}


