//
//  Movie.swift
//  Cinetopia
//
//  Created by Caio Luna on 17/09/25.
//

import Foundation

struct Movie {
	let id: Int
	let title: String
	let image: String
	let synopsis: String
	let rate: Double
	let releadeDate: String
}

let movies: [Movie] = [
	Movie(
		id: 1,
		title: "Avatar: The Way of Water",
		image: "Avatar",
		synopsis: "Set more than a decade after the events of the first film, 'Avatar: The Way of Water' begins to tell the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
		rate: 9.2,
		releadeDate: "Dec 16, 2022"
	),
	Movie(
		id: 2,
		title: "Dune",
		image: "Dune",
		synopsis: "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to a dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of a precious resource in existence, only those who can conquer their own fear will survive.",
		rate: 8.3,
		releadeDate: "Oct 22, 2021"
	),
	Movie(
		id: 3,
		title: "The Matrix",
		image: "Matrix",
		synopsis: "Neo believes that Morpheus, an elusive figure considered to be the most dangerous man alive, can answer his question -- What is the Matrix? Neo is contacted by Trinity, a beautiful stranger who leads him into an underworld where he meets Morpheus. They fight a brutal battle for their lives against a cadre of viciously intelligent secret agents. It is a truth that could cost Neo something more precious than his life.",
		rate: 8.5,
		releadeDate: "Mar 31, 1999"
	),
]

