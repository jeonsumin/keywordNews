//
//  News.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import Foundation

struct News: Decodable {
	let title: String
	let link: String
	let description: String
	let pubDate: String
}
