//
//  MasterTableViewMethods.swift
//  U_Challenge
//
//  Created by Luciano Schillagi on 10/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//


import UIKit

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

