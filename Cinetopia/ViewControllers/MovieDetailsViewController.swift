//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 17/09/25.
//

import UIKit

class MovieDetailsViewController: UIViewController {
	
	var movie: Movie
	
	init(movie: Movie) {
		self.movie = movie
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .background
		title = movie.title
	}
	
	
	
	
}
