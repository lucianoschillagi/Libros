//
//  ApiConstants.swift
//  U_Challenge
//
//  Created by Luciano Schillagi on 14/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation

/* Abstract:
Almacena valores constantes a usar en las solicitudes web.
*/

extension BookApiClient {
	
	//*****************************************************************
	// MARK: - Constants
	//*****************************************************************
	
	struct Constants {
		static let ApiUrl = "https://qodyhvpf8b.execute-api.us-east-1.amazonaws.com/test/books"
	}
	
	//*****************************************************************
	// MARK: - JSON Response Keys
	//*****************************************************************
	
	struct JSONResponseKeys {
		static let ID = "id"
		static let Name = "nombre"
		static let Author = "autor"
		static let Availability = "disponibilidad"
		static let Popularity = "popularidad"
		static let ImageUrl = "imagen"
	}
}
