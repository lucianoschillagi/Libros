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


	
	// MARK: Get Book Images
	// task: obtener las imágenes de los libros
	static func getBookImage(_ imageUrl: String, _ completionHandlerForBookImage: @escaping ( _ imageData: Data?, _ error: String?) -> Void) {
		
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request(imageUrl).responseData { response in
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForBookImage(nil, errorMessage)
				}
			}
			// end status response
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'dataObjectResult' 📦 */
			if let dataObjectResult: Any = response.result.value {
				
				let dataObjectResult = dataObjectResult as! Data
				
				completionHandlerForBookImage(dataObjectResult, nil)
				
				//test
				debugPrint("Los datos de la imagen: \(dataObjectResult)")
			}
		}
	}
	
	
} // end class

