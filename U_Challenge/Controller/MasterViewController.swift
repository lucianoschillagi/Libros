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
	let preModel = ["A", "B", "C", "D", "E"]
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var networkActivity: UIActivityIndicatorView!
	
	
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
		super.viewDidLoad()
	
		navigationItem.title = "Master"
	}


}


	//*****************************************************************
	// MARK: - Table View Data Source Methods
	//*****************************************************************

	extension MasterViewController: UITableViewDataSource {
		
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return preModel.count
		}
	
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			
			let preImageDrink = UIImage(named: "preImage")
			let cellReuseId = "cell"
			let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
			cell.textLabel?.text = "prueba"
			cell.imageView?.image = preImageDrink
			
			return cell
		}
	
}
	
	//*****************************************************************
	// MARK: - Table View Delegate Methods
	//*****************************************************************

extension MasterViewController: UITableViewDelegate {

	// task: navegar hacia el detalle de la película (de acuerdo al listado de películas actual)
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			let storyboardId = "Detail"
			let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! DetailViewController
			//controller.selecteCocktail = cocktailArray[(indexPath as NSIndexPath).row]
			navigationController!.pushViewController(controller, animated: true)
		}

}
