//
//  Meals.swift
//  FetchRewardsIOSCodingChallenge


import Foundation

struct Dessert: Decodable {
    var meals:[MealsList] = [MealsList]()
}

struct MealsList: Decodable, Identifiable {
    
    var strMeal: String = ""
    var strMealThumb: String!
    var idMeal: String!
}

extension MealsList {
    var id: Int {
        return Int(self.idMeal ?? "") ?? 0
    }
}
