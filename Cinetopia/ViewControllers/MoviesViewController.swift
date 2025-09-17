//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 16/09/25.
//

import UIKit

class MoviesViewController: UIViewController {
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .clear
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "moviesCell")
		return tableView
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
	}
	
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath)
		var configuration = cell.defaultContentConfiguration()
		configuration.text = movies[indexPath.row].title
		configuration.textProperties.color = .white
		cell.contentConfiguration = configuration
		cell.backgroundColor = .clear
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
