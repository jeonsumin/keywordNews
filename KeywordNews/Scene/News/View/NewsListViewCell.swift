//
//  NewsListViewCell.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import UIKit
import SnapKit

class NewsListViewCell: UICollectionViewCell{
	static let identifier = "NewsListViewCell"

	lazy var title: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 14, weight: .bold)
		label.textColor = .label

		return label
	}()

	private var pubDate: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 12, weight: .medium)
		label.textColor = .secondaryLabel

		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupViews(news: NewsViewModel) {
		[title, pubDate].forEach {
			addSubview($0)
		}
		title.text = news.title?.htmlToString
		pubDate.text = news.pubDate?.htmlToString

		title.snp.makeConstraints {
			$0.centerY.equalToSuperview()
			$0.leading.trailing.equalToSuperview().inset(8)
		}
		pubDate.snp.makeConstraints {
			$0.leading.trailing.equalTo(title)
			$0.top.equalTo(title.snp.bottom).offset(8)
		}
	}
}
