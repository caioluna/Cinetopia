//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 23/09/25.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
	
	// MARK: - UI Components
	
	private lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 40, left: 24, bottom: 0, right: 24)
		layout.minimumInteritemSpacing = 26
		layout.minimumLineSpacing = 26
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .clear
		collectionView.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteMovieCollectionViewCell")
		collectionView.dataSource = self
		collectionView.delegate = self
		return collectionView
	}()
	
	// MARK: - View live cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .background
		
		setupNavigationBar()
		addSubviews()
		setupConstraints()
	}
	
	// MARK: - Class methods
	
	private func setupNavigationBar() {
		title = "Meus filmes favoritos"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.largeTitleTextAttributes = [
			NSAttributedString.Key.foregroundColor: UIColor.white
		]
		navigationItem.setHidesBackButton(true, animated: true)
	}
	
	private func addSubviews() {
		view.addSubview(collectionView)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
}

extension FavoriteMoviesViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return movies.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteMovieCollectionViewCell", for: indexPath) as? FavoriteMovieCollectionViewCell {
			let movie = movies[indexPath.item]
			cell.configureCell(movie: movie)
			return cell
		}
		
		return UICollectionViewCell()
	}
}

extension FavoriteMoviesViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / 3, height: 180)
	}
}
