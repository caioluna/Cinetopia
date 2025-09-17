//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 16/09/25.
//

import UIKit

class MoviesViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .background
		setupNavigationBar()
	}
	
	private func setupNavigationBar() {
		title = "Filmes populares"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.largeTitleTextAttributes = [
			NSAttributedString.Key.foregroundColor: UIColor.white
		]
		navigationItem.setHidesBackButton(true, animated: true)
	}
	
}
