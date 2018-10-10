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
--
*/

class MasterViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	/// Model
	var book: Book?
	var bookArray = [Book]()
	var bookPopularityArray = [Book]()
	
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
	
		navigationItem.title = "Bienvenido a la bibliotecta Ualá"
		
		// Networking ⬇ : Books
		BookApiClient.getBooks { (success, resultBooks, error) in
			
			DispatchQueue.main.async {
				
				if success {
					// comprueba si el 'resultBooks' recibido contiene algún valor
					if let resultBooks = resultBooks {
						self.bookArray = resultBooks // 🔌 👏
						self.networkActivity.stopAnimating()
						self.bookTableView.reloadData()
						
					}
					
				} else {
					// si devuelve un error
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


	//*****************************************************************
	// MARK: - Table View Data Source Methods
	//*****************************************************************

	extension MasterViewController: UITableViewDataSource {
		
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return bookArray.count
		}
	
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			
			let preImageDrink = UIImage(named: "preImage")
			let cellReuseId = "cell"
			let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
			
			
			//var popularBookArray = [Book]()
			

			book = bookArray[(indexPath as NSIndexPath).row]
			
			cell.imageView?.image = preImageDrink
			
			// popularity
			let popularity = book?.popularity
			var popularityString = String()
		
			
			if let popularity = popularity { popularityString = String(popularity) }
			
			
			// availability
			if let availability = book?.availability {
				
				if availability == true {
					cell.accessoryType = .checkmark
				} else {
					cell.accessoryType = .none
				}
				
			}
			
			cell.textLabel?.text = book?.name
			cell.detailTextLabel?.text = (book?.author)! + " | Popularidad:" + "\(popularityString)"
			
			// get image
			if (book?.image) != nil {
				
				let _ = BookApiClient.getBookImage((book?.image)!) { (imageData, error) in
					
					if let image = UIImage(data: imageData!) {
						DispatchQueue.main.async {
							cell.imageView!.image = image
						}
					} else {
						print(error ?? "empty error")
					}
				}
			}
	
			return cell
		}
	
}
	
	//*****************************************************************
	// MARK: - Table View Delegate Methods
	//*****************************************************************

extension MasterViewController: UITableViewDelegate {

	// task: navegar hacia el detalle del libro
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			let storyboardId = "Detail"
			let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! DetailViewController
			controller.selectedBook = bookArray[(indexPath as NSIndexPath).row]
			navigationController!.pushViewController(controller, animated: true)
		}

}
