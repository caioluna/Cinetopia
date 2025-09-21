//
//  Movie.swift
//  Cinetopia
//
//  Created by Caio Luna on 17/09/25.
//

import Foundation

struct Movie: Decodable {
	let id: Int
	let title: String
	let image: String
	let synopsis: String
	let rate: Double
	let releaseDate: String
}

