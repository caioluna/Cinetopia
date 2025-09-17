//
//  ViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 14/09/25.
//

import UIKit

class HomeViewController: UIViewController {
	
	private lazy var logoImageView: UIImageView = {
		let imageView = UIImageView(image: .logo)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var coupleImageView: UIImageView = {
		let imageView = UIImageView(image: .couple)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var welcomeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
		label.textColor = .white
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20, weight: .bold)
		label.numberOfLines = 0
		return label
	}()
	
	private lazy var welcomeButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Quero começar!", for: .normal)
		button.backgroundColor = .buttonBackground
		button.setTitleColor(.background, for: .normal)
		button.titleLabel?.font = .boldSystemFont(ofSize: 20)
		button.layer.cornerRadius = 32
		button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
		return button
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [
			logoImageView,
			coupleImageView,
			welcomeLabel,
			welcomeButton
		])
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 24
		stackView.distribution = .fillProportionally
		stackView.alignment = .center
		return stackView
	}()
	
	@objc private func buttonPressed() {
		navigationController?.pushViewController(MoviesViewController(), animated: true)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = .background
		addSubviews()
		setupConstraints()
	}
	
	private func addSubviews() {
		view.addSubview(stackView)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -127),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
			
			logoImageView.widthAnchor.constraint(equalToConstant: 174),
			logoImageView.heightAnchor.constraint(equalToConstant: 102),
			
			coupleImageView.heightAnchor.constraint(equalToConstant: 289),
			
			welcomeButton.heightAnchor.constraint(equalToConstant: 68),
			welcomeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 54),
			welcomeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -54),
		])
	}

}

