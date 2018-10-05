//
//  DetailViewController.swift
//  U_Challenge
//
//  Created by Luciano Schillagi on 05/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	
		//var selectedRow: Cocktail?
	var selectedBook: Book?
	

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	
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
			
			
			navigationItem.title = selectedBook?.name
			
			
			nameLabel.text = selectedBook?.name
			authorLabel.text = selectedBook?.author
			
			if selectedBook?.availability == true {
				availabilityLabel.text = "Disponible"
			} else {
				availabilityLabel.text = "No disponible"
			}
			
			var popularityString = ""
			var idString = ""
			if let popularityInt = selectedBook?.popularity { popularityString = String(popularityInt) }
			if let idInt = selectedBook?.id { idString = String(idString) }
			
			idLabel.text = idString
			popularityLabel.text = popularityString
			
			// get image
			if let imageUrl = selectedBook?.image {
				
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
