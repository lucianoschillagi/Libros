//
//  DetailViewController.swift
//  U_Challenge
//
//  Created by Luciano Schillagi on 05/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
La pantalla de detalle muestra información adicional sobre el libro seleccionado.
*/

class DetailViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var selectedBook: Book?
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var bookImage: UIImageView!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var authorLabel: UILabel!
	@IBOutlet weak var availabilityLabel: UILabel!
	@IBOutlet weak var popularityLabel: UILabel!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
    override func viewDidLoad() {
        super.viewDidLoad()
			
				// setup UI
				navigationItem.title = selectedBook?.name
				setupUI()
    }
	
	//*****************************************************************
	// MARK: - Setup UI Elements
	//*****************************************************************
	
	// task: configurar los elementos visibles de la UI
	func setupUI() {
		
		nameLabel.text = "Nombre: " + (selectedBook?.name)!
		authorLabel.text = "Autor: " + (selectedBook?.author)!
		
		if selectedBook?.availability == true {
			availabilityLabel.text =  "Disponible"
		} else {
			availabilityLabel.text = "No disponible"
		}
		
		var popularityString = ""
		var idString = String()
		
		if let popularityInt = selectedBook?.popularity {
			popularityString = String(popularityInt)
		}
		
		if let selectedId = selectedBook?.id {
			idString = String(selectedId)
		}
		
		idLabel.text = "ID: " + idString
		popularityLabel.text = "Popularidad: " + popularityString
		
		// get image
		if (selectedBook?.image) != nil {
			
			let _ = BookApiClient.getBookImage((selectedBook?.image)!) { (imageData, error) in
				
				if let image = UIImage(data: imageData!) {
					
					DispatchQueue.main.async {
						self.bookImage.image = image
						
					}
				} else {
					self.bookImage.backgroundColor = .gray
				}
			}
			
		}
		
	}
	

} // end class
