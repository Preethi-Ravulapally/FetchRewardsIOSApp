
import Foundation

struct MealDetails: Decodable {
    var meals:[IngredientsList] = [IngredientsList]()
}

struct IngredientsList: Decodable {
    var idMeal: String = ""
    var strMeal: String!
    var strDrinkAlternate: String!
    var strCategory: String!
    var strArea: String!
    var strInstructions: String!
    var strMealThumb: String!
    var strTags: String!
    var strYoutube: String!
    var strIngredient1:String!
    var strIngredient2: String!
    var strIngredient3: String!
    var strIngredient4: String!
    var strIngredient5: String!
    var strIngredient6: String!
    var strIngredient7: String!
    var strIngredient8: String!
    var strIngredient9: String!
    var strIngredient10: String!
    var strIngredient11: String!
    var strIngredient12: String!
    var strIngredient13: String!
    var strIngredient14: String!
    var strIngredient15: String!
    var strIngredient16: String!
    var strIngredient17: String!
    var strIngredient18: String!
    var strIngredient19: String!
    var strIngredient20: String!
    var strMeasure1: String!
    var strMeasure2: String!
    var strMeasure3: String!
    var strMeasure4: String!
    var strMeasure5: String!
    var strMeasure6: String!
    var strMeasure7: String!
    var strMeasure8: String!
    var strMeasure9: String!
    var strMeasure10: String!
    var strMeasure11: String!
    var strMeasure12: String!
    var strMeasure13: String!
    var strMeasure14: String!
    var strMeasure15: String!
    var strMeasure16: String!
    var strMeasure17: String!
    var strMeasure18: String!
    var strMeasure19: String!
    var strMeasure20: String!
    var strSource: String!
    var strImageSource: String!
    var strCreativeCommonsConfirmed: String!
    var dateModified: String!
    
}

extension IngredientsList {
    
    var ingedients: [String] {
        return [self.strIngredient1 ?? "", self.strIngredient2 ?? "", self.strIngredient3 ?? "", self.strIngredient4 ?? "", self.strIngredient5 ?? "", self.strIngredient6 ?? "", self.strIngredient7 ?? "", self.strIngredient8 ?? "", self.strIngredient9 ?? "", self.strIngredient10 ?? "", self.strIngredient11 ?? "", self.strIngredient12 ?? "", self.strIngredient13 ?? "", self.strIngredient14 ?? "", self.strIngredient15 ?? "", self.strIngredient16 ?? "", self.strIngredient17 ?? "", self.strIngredient18 ?? "", self.strIngredient19 ?? "", self.strIngredient20 ?? ""]
    }
    
    var measurement: [String] {
        return [self.strMeasure1 ?? "", self.strMeasure2 ?? "", self.strMeasure3 ?? "", self.strMeasure4 ?? "", self.strMeasure5 ?? "", self.strMeasure6 ?? "", self.strMeasure7 ?? "", self.strMeasure8 ?? "", self.strMeasure9 ?? "", self.strMeasure10 ?? "", self.strMeasure11 ?? "", self.strMeasure12 ?? "", self.strMeasure13 ?? "", self.strMeasure14 ?? "", self.strMeasure15 ?? "", self.strMeasure16 ?? "", self.strMeasure17 ?? "", self.strMeasure18 ?? "", self.strMeasure19 ?? "", self.strMeasure20 ?? ""]
    }
    
}

