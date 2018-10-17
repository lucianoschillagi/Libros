//
//  Book.swift
//  
//
//  Created by Luciano Schillagi on 05/10/2018.
//

/* Model */

import Foundation

/* Abstract:
Un objeto que representa un libro preparado para recibir y alojar los datos a recibir de la API.
*/

struct Book {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// datos libro
	let id: Int? // 'id'
	let name: String? // 'nombre'
	let author: String? // 'autor'
	let availability: Bool? // 'disponibilidad'
	let popularity: Int? // 'popularidad'
	let image: String? // 'imagen'

	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	// construye el objeto 'Libro' desde un diccionario  👈
	init(dictionary: [String:AnyObject]) {
		id = dictionary[BookApiClient.JSONResponseKeys.ID] as? Int
		name = dictionary[BookApiClient.JSONResponseKeys.Name] as? String
		author = dictionary[BookApiClient.JSONResponseKeys.Author] as? String
		availability = dictionary[BookApiClient.JSONResponseKeys.Availability] as? Bool
		popularity = dictionary[BookApiClient.JSONResponseKeys.Popularity] as? Int
		image = dictionary[BookApiClient.JSONResponseKeys.ImageUrl] as? String
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	static func bookFromResults(_ bookResults: [[String:AnyObject]]) -> [Book] {
		
		var bookArray = [Book]()
		
		// itera a través del array de diccionarios, cada ´Book´ es un diccionario
		for result in bookResults {
			bookArray.append(Book(dictionary: result))
		}
		
		return bookArray
	}
	
} // end struct
