//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Caio Luna on 17/09/25.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
	
	private lazy var movieTitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .boldSystemFont(ofSize: 24)
		label.textAlignment = .center
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	private lazy var movieBannerImageView: UIImageView = {
		let imageview = UIImageView()
		imageview.translatesAutoresizingMaskIntoConstraints = false
		imageview.contentMode = .scaleAspectFill
		imageview.layer.cornerRadius = 16
		imageview.layer.masksToBounds = true
		return imageview
	}()
	
	private lazy var movieRatingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .boldSystemFont(ofSize: 20)
		label.textAlignment = .center
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	private lazy var movieSynopsisLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 14)
		label.textColor = .white.withAlphaComponent(0.75)
		label.numberOfLines = 0
		return label
	}()
	
	var movie: Movie
	let padding:CGFloat = 20
	
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
		
		addSubviews()
		setupConstraints()
		configureMovie()
	}
	
	private func configureMovie() {
		let url = URL(string: movie.image)
		
		movieTitleLabel.text = movie.title
		movieBannerImageView.kf.setImage(with: url)
		movieRatingLabel.text = "Classificação dos usuários: \(movie.rate)"
		movieSynopsisLabel.text = movie.synopsis
	}
	
	private func addSubviews() {
		view.addSubview(movieTitleLabel)
		view.addSubview(movieBannerImageView)
		view.addSubview(movieRatingLabel)
		view.addSubview(movieSynopsisLabel)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
			movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			
			movieBannerImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 32),
			movieBannerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			movieBannerImageView.widthAnchor.constraint(equalToConstant: 176),
			movieBannerImageView.heightAnchor.constraint(equalToConstant: 235),
			
			movieRatingLabel.topAnchor.constraint(equalTo: movieBannerImageView.bottomAnchor, constant: 24),
			movieRatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			movieRatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			
			movieSynopsisLabel.topAnchor.constraint(equalTo: movieRatingLabel.bottomAnchor, constant: 40),
			movieSynopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			movieSynopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			
		])
	}
	
}
