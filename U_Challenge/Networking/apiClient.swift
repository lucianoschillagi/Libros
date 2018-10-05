//
//  apiClient.swift
//  
//
//  Created by Luciano Schillagi on 05/10/2018.
//


/* Networking */

import Foundation
import Alamofire

/* Abstract
*/

class BookApiClient: NSObject {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init() { super.init() }
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// shared session
	var session = URLSession.shared
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
	
	// MARK: Get Libros
	// task: obtener una serie de libros
	static func getBooks(completionHandlerForGetBooks: @escaping (_ success: Bool, _ result: [Book]?, _ error: String?) -> Void)  {

		let cocktailUrl = "https://qodyhvpf8b.execute-api.us-east-1.amazonaws.com/test/books"

		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request(cocktailUrl).responseJSON { response in

			debugPrint("🎬\(response)")

			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForGetBooks(false, nil, errorMessage)
				}
			}
			// end response status code
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
			if let jsonObjectResult: Any = response.result.value {

				debugPrint("☠️jsonObjectResult")

				let jsonObjectResultDictionary = jsonObjectResult as! [[String:AnyObject]]

				debugPrint("🤜JSON BOOKS: \(jsonObjectResult)") // JSON obtenido

					let resultsBooks = Book.bookFromResults(jsonObjectResultDictionary as! [[String : AnyObject]])

					//test
					debugPrint("🤾🏼‍♂️ Books...\(resultsBooks)")
					completionHandlerForGetBooks(true, resultsBooks, nil)
			}
		}
	}


	
//	// MARK: Get Detail Cocktails
//	// task: obtener los datos de los detalles de cada trago
//	static func getCocktailDetails (_ idDrink: String, _ completionHandlerForGetCocktailsDetails: @escaping (_ success: Bool, _ result: [Cocktail]?, _ error: String?) -> Void) {
//		
//		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
//		Alamofire.request("http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)").responseJSON { response in
//			
//			debugPrint("🎬\(response)")
//			
//			// response status code
//			if let status = response.response?.statusCode {
//				switch(status){
//				case 200:
//					print("example success")
//				default:
//					let errorMessage = "error with response status: \(status)"
//					completionHandlerForGetCocktailsDetails(false, nil, errorMessage)
//				}
//			}
//			
//			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
//			if let jsonObjectResult: Any = response.result.value {
//				
//				debugPrint("☠️jsonObjectResult")
//				
//				let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
//				
//				debugPrint("🤜JSON DETAIL COCKTAILS: \(jsonObjectResult)") // JSON obtenido
//				
//				if let results = jsonObjectResultDictionary["drinks"] {
//					
//					let resultsCocktailsDetails = Cocktail.drinkFromResults(results as! [[String : AnyObject]])
//					
//					//test
//					debugPrint("🤾🏼‍♂️ Cocktails...\(resultsCocktailsDetails)")
//					
//					completionHandlerForGetCocktailsDetails(true, resultsCocktailsDetails, nil)
//					
//				}
//			}
//		}
//
//	}
//	
//	
//	// MARK: Get Cocktail Images
//	// task: obtener las imágenes de los tragos
//	static func getCocktailImage(_ imageUrl: String, _ completionHandlerForCocktailImage: @escaping ( _ imageData: Data?, _ error: String?) -> Void) {
//		
//		
//		//http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=16108
//		
//		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
//		Alamofire.request(imageUrl).responseData { response in
//			
//			// response status code
//			if let status = response.response?.statusCode {
//				switch(status){
//				case 200:
//					print("example success")
//				default:
//					let errorMessage = "error with response status: \(status)"
//					completionHandlerForCocktailImage(nil, errorMessage)
//				}
//			}
//			
//			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'dataObjectResult' 📦 */
//			if let dataObjectResult: Any = response.result.value {
//				
//				let dataObjectResult = dataObjectResult as! Data
//				
//				completionHandlerForCocktailImage(dataObjectResult, nil)
//				
//				//test
//				debugPrint("Los datos de la imagen: \(dataObjectResult)")
//			}
//		}
//	}
	
	
	
	
} // end class

