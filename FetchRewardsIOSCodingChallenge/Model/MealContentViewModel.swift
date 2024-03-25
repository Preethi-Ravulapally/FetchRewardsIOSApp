
import Foundation
import UIKit
import SwiftUI

class MealContentViewModel: ObservableObject {
    
    @Published var dessert:Dessert = Dessert()
    @Published var ingredients:MealDetails = MealDetails()
    @Published var asc_meal_list = Dessert().meals
    @Published var errorMessage = ""
    
    let imageCacheManager = CacheImageManager.imageManager
    
    func addImage(image: UIImage, mealName: String) {
        imageCacheManager.add(image: image, mealName: mealName)
    }
    
    func getImage(mealName: String) -> UIImage? {
        return imageCacheManager.get(mealName: mealName)
    }
    
    init() {
        fetchMealsFromDesserts() { result in
            if result {
                self.errorMessage = ""
            }
            else {
                self.errorMessage = "Failed to get Meals from Desserts"
            }
        }
    }
    
    func fetchMealsFromDesserts(completion: @escaping(Bool) -> Void) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else {
            return
        }
        let getTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard error == nil, let data = data else { return }
            do {
                let response = try JSONDecoder().decode(Dessert.self, from: data)
                DispatchQueue.main.async {
                    self?.dessert = response
                    self?.asc_meal_list = response.meals.sorted{$0.strMeal.lowercased() < $1.strMeal.lowercased()}
                    completion(true)
                }
            } catch {
                completion(false)
            }
        }
        getTask.resume()
    }
    
    func fetchIngredientsFromMeal(mealId: String, completion: @escaping(Bool) -> Void) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")
        else {
            return
        }
        let getTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard error == nil, let data = data else { return }
            do {
                let result = try JSONDecoder().decode(MealDetails.self, from: data)
                DispatchQueue.main.async {
                    self?.ingredients = result
                    completion(true)
                }
            }
            catch {
                completion(false)
            }
        }
        getTask.resume()
    }

}
