//
//  HeadlineViewModel.swift
//  KeywordNews
//
//  Created by deepvisions on 2023/09/21.
//

import Foundation

struct HeadlineViewModel {
	var headline: [Article]

	func headlineAtIndex(_ index: Int) -> HeadlineVM {
		let article = headline[index]
		return HeadlineVM(headline: article)
	}

	func numberOfRowInSection(_ section: Int) -> Int {
		return headline.count
	}
}

struct HeadlineVM {
	let headline: Article

	init(headline: Article) {
		self.headline = headline
	}
	var title: String? {
		headline.title
	}
	var urlToImage: String? {
		headline.urlToImage
	}
	var url: String? {
		headline.url
	}
}
