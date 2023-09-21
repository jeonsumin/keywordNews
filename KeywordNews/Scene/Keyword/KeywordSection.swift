//
//  KeywordSection.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import UIKit
import TTGTags
import SnapKit

class KeywordSection: UICollectionViewCell {
	static let identifier = "KeywordSection"

	private lazy var tagCollectionView = TTGTextTagCollectionView()

	let tags: [String] = ["경제","사회","정치"]

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupKeywordView() {
		addSubview(tagCollectionView)
		tagCollectionView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}

		setupTagCollectionView()
	}

	func setupTagCollectionView() {
		//		tagCollectionView.delegate = self
		tagCollectionView.numberOfLines = 1
		tagCollectionView.scrollDirection = .horizontal
		tagCollectionView.selectionLimit = 1

		tagCollectionView.showsHorizontalScrollIndicator = false
		let insetValue: CGFloat = 16.0
		tagCollectionView.contentInset = UIEdgeInsets(top: insetValue,
													  left: insetValue,
													  bottom: insetValue,
													  right: insetValue)

		let cornerRadiusValue: CGFloat = 12.0
		let shadowOpacity: CGFloat = 0.0
		let extraSpace = CGSize(width: 20.0, height: 12.0)
		let color = UIColor.systemOrange

		let style = TTGTextTagStyle()
		style.backgroundColor = color
		style.cornerRadius = cornerRadiusValue
		style.borderWidth = 0.0
		style.shadowOpacity = shadowOpacity
		style.extraSpace = extraSpace

		let selectedStyle = TTGTextTagStyle()
		selectedStyle.backgroundColor = .white
		selectedStyle.cornerRadius = cornerRadiusValue
		selectedStyle.shadowOpacity = shadowOpacity
		selectedStyle.extraSpace = extraSpace
		selectedStyle.borderColor = color

		tags.forEach { tag in
			let font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
			let tagContent = TTGTextTagStringContent(text: tag,
													 textFont: font,
													 textColor: .white)
			let selectedTagContents = TTGTextTagStringContent(text: tag,
															  textFont: font,
															  textColor: color)

			let tags = TTGTextTag(content: tagContent,
								  style: style,
								  selectedContent: selectedTagContents,
								  selectedStyle: selectedStyle)

			tagCollectionView.addTag(tags)
		}
		tagCollectionView.reload()
	}
}
