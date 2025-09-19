//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 16/09/25.
//

import UIKit

class MoviesViewController: UIViewController {
	
	private var filteredMovies: [Movie] = []
	private var isSearchActive: Bool = false
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .clear
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "moviesCell")
		return tableView
	}()
	
	private lazy var searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		searchBar.placeholder = "Pesquisar"
		searchBar.delegate = self
		searchBar.searchTextField.backgroundColor = .white.withAlphaComponent(0.5)
		return searchBar
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .background
		setupNavigationBar()
		addSubviews()
		setupConstraints()
	}
	
	private func addSubviews() {
		view.addSubview(tableView)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
	
	private func setupNavigationBar() {
		title = "Filmes populares"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.largeTitleTextAttributes = [
			NSAttributedString.Key.foregroundColor: UIColor.white
		]
		navigationItem.setHidesBackButton(true, animated: true)
		navigationItem.titleView = searchBar
	}
	
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return isSearchActive ? filteredMovies.count : movies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath) as? MovieTableViewCell {
			let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
			cell.configureCell(movie: movie)
			cell.selectionStyle = .none
			return cell
		}
		
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
		let detailsVC = MovieDetailsViewController(movie: movie)
		navigationController?.pushViewController(detailsVC, animated: true)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		152
	}
}

extension MoviesViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if searchText.isEmpty {
			isSearchActive = false
		} else {
			isSearchActive = true
			filteredMovies = movies.filter({ movie in
				movie.title.lowercased().contains(searchText.lowercased())
			})
		}
		tableView.reloadData()
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
	}
}
