//
//  HeadlineResponseModel.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import Foundation

struct HeadlineResponseModel: Codable {
	let totalResults: Int
	let articles: [Article]?

}
