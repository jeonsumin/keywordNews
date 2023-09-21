//
//  ViewModel.swift
//  KeywordNews
//
//  Created by terry on 2023/09/20.
//

import Foundation

struct NewsListViewModel {
	var news: [News]

	var numberOfSections: Int {
		return 3
	}

	func newsAtIndex(_ index: Int) -> NewsViewModel {
		let news = news[index]
		return NewsViewModel(news: news)
	}

	func numberOfRowInSection(_ section: Int) -> Int {
		return news.count
	}

}

struct NewsViewModel {
	let news: News

	init(news: News) {
		self.news = news
	}

	var title: String? {
		news.title
	}

	var description: String? {
		news.description
	}

	var link: String? {
		news.link
	}

	var pubDate: String? {
		news.pubDate
	}
}
