//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Caio Luna on 17/09/25.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
	
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
		label.font = .boldSystemFont(ofSize: 18)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	private lazy var movieReleaseLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 14)
		label.textColor = .white.withAlphaComponent(0.75)
		return label
	}()
	
	func configureCell(movie: Movie) {
		movieTitleLabel.text = movie.title
		moviePosterImageView.image = UIImage(named: movie.image)
		movieReleaseLabel.text = "Lançamento \(movie.releadeDate)"
	}
	
	private func addSubviews() {
		addSubview(moviePosterImageView)
		addSubview(movieTitleLabel)
		addSubview(movieReleaseLabel)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			moviePosterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			moviePosterImageView.heightAnchor.constraint(equalToConstant: 120),
			moviePosterImageView.widthAnchor.constraint(equalToConstant: 90),
			
			movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
			movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
			
			movieReleaseLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
			movieReleaseLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 4),
		])
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .background
		addSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
