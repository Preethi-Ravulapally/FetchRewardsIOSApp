
import SwiftUI

struct MealsView: View {
    
    @EnvironmentObject var mealModel: MealContentViewModel
    @State var seachMeal = ""
    @State var selectedMeal: String?
    @State var mealList: IngredientsList? = nil
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        if mealModel.dessert.meals.count > 0 {
                            ForEach(mealModel.asc_meal_list) { meals in
                                MealsListCard(mealList: meals)
                                    .onTapGesture {
                                        selectedMeal = meals.idMeal
                                    }
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(20)
                            }
                            .padding(.vertical)
                        }
                    }
                    .fullScreenCover(item: $selectedMeal) { meal in
                        IngredientsCard(selectedMealId: meal)
                            .preferredColorScheme(.dark)
                    }
                }
                .padding(.horizontal)
                .cornerRadius(20)
                
            }
            .background(.ultraThinMaterial)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Meals")
                        .font(.largeTitle.bold())
                }
            }
        }
    }
}

extension String: Identifiable {
    public var id: String { return self }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView().environmentObject(MealContentViewModel())
            .preferredColorScheme(.dark)
    }
}
