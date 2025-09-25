//
//  FavoriteMovieViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 24/09/25.
//

import UIKit

class FavoriteMovieCollectionViewCell: UICollectionViewCell {
	// MARK: - UI Components
	
	private lazy var moviePosterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 8
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	private lazy var movieTitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.font = .systemFont(ofSize: 18, weight: .medium)
		label.textAlignment = .center
		label.numberOfLines = 1
		return label
	}()
	
	private lazy var favoriteButton: UIButton = {
		let button = UIButton()
		let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
		button.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(iconImage, for: .normal)
		return button
	}()
	
	// MARK: - View Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .background
		
		addSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Class Methods
	
	private func addSubviews() {
		addSubview(moviePosterImageView)
		addSubview(movieTitleLabel)
		addSubview(favoriteButton)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
			moviePosterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			moviePosterImageView.heightAnchor.constraint(equalToConstant: 120),
			moviePosterImageView.widthAnchor.constraint(equalToConstant: 89),
			
			movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 8),
			movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			favoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 16),
			favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			favoriteButton.widthAnchor.constraint(equalToConstant: 18),
			favoriteButton.heightAnchor.constraint(equalToConstant: 15),
		])
	}
	
	func configureCell(movie: Movie) {
		let url = URL(string: movie.image)
		
		moviePosterImageView.kf.setImage(with: url)
		movieTitleLabel.text = movie.title
	}
	
	@objc func favoriteButtonPressed(_ sender: UIButton) {
		print("clicado")
	}
}
