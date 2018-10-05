//
//  Model.swift
//  
//
//  Created by Luciano Schillagi on 05/10/2018.
//

/* Model */

import Foundation

/* Abstract:

*/

struct Model {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
//	// cocktail list
//	let drinkName: String? // 'strDrink'
//	let drinkThumb: String? // 'strDrinkThumb'
//	let idDrink: String? // 'idDrink'
//
//	// cocktail detail
//	let drinkInstructions: String?
//	let drink: String?
//	let drinkDetailThumb: String?
//	// ingredients
//	let drinkIngredient1: String?
//	let drinkIngredient2: String?
//	let drinkIngredient3: String?
//	let drinkIngredient4: String?
//	let drinkIngredient5: String?
//
//
//	// measures
//	let drinkMeasure1: String?
//	let drinkMeasure2: String?
//	let drinkMeasure3: String?
//	let drinkMeasure4: String?
//	let drinkMeasure5: String?
	
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// construye el objeto 'Cocktail' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
//		// cocktail list
//		drinkName = dictionary["strDrink"] as? String
//		drinkThumb = dictionary["strDrinkThumb"] as? String
//		idDrink = dictionary["idDrink"] as? String
//		// cocktail detail
//		drinkInstructions = dictionary["strInstructions"] as? String
//		drink = dictionary["strDrink"] as? String
//		drinkDetailThumb = dictionary["strDrinkThumb"] as? String
//		// ingredients
//		drinkIngredient1 = dictionary["strIngredient1"] as? String
//		drinkIngredient2 = dictionary["strIngredient2"] as? String
//		drinkIngredient3 = dictionary["strIngredient3"] as? String
//		drinkIngredient4 = dictionary["strIngredient4"] as? String
//		drinkIngredient5 = dictionary["strIngredient5"] as? String
//		// measures
//		drinkMeasure1 = dictionary["strMeasure1"] as? String
//		drinkMeasure2 = dictionary["strMeasure2"] as? String
//		drinkMeasure3 = dictionary["strMeasure3"] as? String
//		drinkMeasure4 = dictionary["strMeasure4"] as? String
//		drinkMeasure5 = dictionary["strMeasure5"] as? String
		
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	static func drinkFromResults(_ drinkResults: [[String:AnyObject]]) -> [Model] {
		
		var modelArray = [Model]()
		
		// itera a través del array de diccionarios, cada ´Cocktail´ es un diccionario
		for result in drinkResults {
			modelArray.append(Model(dictionary: result))
		}
		
		return modelArray
	}
	
} // end class
