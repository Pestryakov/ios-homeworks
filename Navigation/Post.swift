//
//  Post.swift
//  Navigation
//
//  Created by Maxim P on 12/06/2024.
//

import Foundation

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let posts: [Post] = [
    Post(author: "Gravity Falls", description: "'Gravity Falls' is an animated mystery-comedy series created by Alex Hirsch. It follows twins Dipper and Mabel Pines as they spend the summer with their great-uncle Stan in the mysterious town of Gravity Falls, Oregon. They encounter supernatural creatures and unravel secrets while working at Stan's tourist trap, the Mystery Shack.", image: "gravityFalls", likes: 10, views: 100),
    Post(author: "Rick and Morty", description: "'Rick and Morty' is an animated sci-fi sitcom created by Justin Roiland and Dan Harmon. The show follows the misadventures of an eccentric and alcoholic scientist, Rick Sanchez, and his good-hearted but easily influenced grandson, Morty Smith, as they travel across dimensions and encounter bizarre situations.", image: "morty", likes: 20, views: 200),
    Post(author: "The Simpsons", description: "'The Simpsons' is a long-running animated sitcom created by Matt Groening. Set in the fictional town of Springfield, it follows the dysfunctional yet lovable Simpson family—Homer, Marge, Bart, Lisa, and Maggie—along with a colorful cast of characters. Known for its humor and social commentary, it's a cultural icon.", image: "simpsons", likes: 30, views: 300),
    Post(author: "The Mystery of the Third Planet", description: "'The Mystery of the Third Planet' is a Soviet animated film based on Kir Bulychev's book. It follows the journey of Captain Zelyony, his daughter Alisa, and the alien Gromozeka as they search for rare animals on the planet of Buratino. Along the way, they encounter various challenges and adventures.", image: "thirdPlanet", likes: 40, views: 400)
]
