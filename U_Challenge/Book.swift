//
//  Book.swift
//  
//
//  Created by Luciano Schillagi on 05/10/2018.
//

/* Model */

import Foundation

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
		id = dictionary["id"] as? Int
		name = dictionary["nombre"] as? String
		author = dictionary["autor"] as? String
		availability = dictionary["disponibilidad"] as? Bool
		popularity = dictionary["popularidad"] as? Int
		image = dictionary["imagen"] as? String
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	static func bookFromResults(_ bookResults: [[String:AnyObject]]) -> [Book] {
		
		var bookArray = [Book]()
		
		// itera a través del array de diccionarios, cada ´Libro´ es un diccionario
		for result in bookResults {
			bookArray.append(Book(dictionary: result))
		}
		
		return bookArray
	}
	
} // end class
