//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 16/09/25.
//

import UIKit

class MoviesViewController: UIViewController {
	
	var names: [String] = [
			"Giovanna",
			"João",
			"Ana",
			"Lucas"
	]
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .clear
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "nameCell")
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
		return names.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
		var configuration = cell.defaultContentConfiguration()
		configuration.text = names[indexPath.row]
		configuration.textProperties.color = .white
		cell.contentConfiguration = configuration
		cell.backgroundColor = .clear
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
