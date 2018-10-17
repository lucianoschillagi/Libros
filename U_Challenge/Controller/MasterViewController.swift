//
//  MasterViewController.swift
//  U_Challenge
//
//  Created by Luciano Schillagi on 05/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
La pantalla inicial muestra un listado de libros.
*/

class MasterViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	/// Model
	var book: Book? // representa un objeto 'libro'
	var bookArray = [Book]() // un array con los objetos 'Book' recibidos
	var bookPopularityArray = [Book]() // un array con los libros ordenados de más a menos popular
	var bookLessPopularityArray = [Book]() // un array con los libros ordenados de menos a más popular
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var bookTableView: UITableView!
	@IBOutlet weak var networkActivity: UIActivityIndicatorView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// setup UI
		navigationItem.title = "Bienvenido a la bibliotecta Ualá"
		updateUI_afterCompleteNetworkRequest()
	}
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	// task: ordenar la tabla de libro menos a más popular
	@IBAction func reorderTableView(_ sender: UIBarButtonItem) {
		
	}
	

	//*****************************************************************
	// MARK: - Update the UI (after complete network request)
	//*****************************************************************
	
	func updateUI_afterCompleteNetworkRequest() {
		// Networking ⬇ : Books
		BookApiClient.getBooks { (success, resultBooks, error) in
			
			// Dispatch
			DispatchQueue.main.async {
				if success {
					// comprueba si el 'resultBooks' recibido contiene algún valor
					if let resultBooks = resultBooks {
						
						// con los libros obtenidos crea 3 arrays distintos
						self.bookArray = resultBooks // 🔌 👏
						self.bookPopularityArray = self.bookArray.sorted(by: { $0.popularity! > $1.popularity! } )
						self.bookLessPopularityArray = self.bookArray.sorted(by: { $0.popularity! < $1.popularity! } )
						
						self.networkActivity.stopAnimating()
						self.bookTableView.reloadData()
					}
				} else {
					// si devuelve un error, mostrar un alert view
					self.displayAlertView("Error Request", error)
				}
			}
		}
	}
	
	//*****************************************************************
	// MARK: - Alert View
	//*****************************************************************
	
	/**
	Muestra al usuario un mensaje acerca de porqué la solicitud falló.
	
	- Parameter title: El título del error.
	- Parameter message: El mensaje acerca del error.
	
	*/
	func displayAlertView(_ title: String?, _ error: String?) {
		
		// si ocurre un error en la solicitud, mostrar una vista de alerta!
		if error != nil {
			let alertController = UIAlertController(title: title, message: error, preferredStyle: .alert)
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in
			}
			
			alertController.addAction(OKAction)
			self.present(alertController, animated: true) {}
		}
	}
	
	
} // end class


