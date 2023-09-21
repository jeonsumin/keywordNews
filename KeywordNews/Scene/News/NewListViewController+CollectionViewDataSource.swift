//
//  NewListViewController+CollectionViewDataSource.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import UIKit

extension NewsListViewController {

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch section {
		case 0:
			return self.headlineListVM == nil ? 0 : headlineListVM.numberOfRowInSection(section)
		case 1:
			return 1
		default:
			return self.newsListVM == nil ? 0 : newsListVM.numberOfRowInSection(section)
		}
	}

	override func collectionView(
		_ collectionView: UICollectionView,
		cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

			switch indexPath.section {
			case 0:
				guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeadlineSectionCell.identifier,
																	for: indexPath) as? HeadlineSectionCell
											else { return UICollectionViewCell() }

					let article = headlineListVM.headlineAtIndex(indexPath.row)
					cell.setupViews(headline: article)

				return cell
			case 1:
				guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordSection.identifier,
																	for: indexPath) as? KeywordSection
											else { return UICollectionViewCell() }
					cell.setupKeywordView()
				return cell
			default:
				guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsListViewCell.identifier,
																	for: indexPath) as? NewsListViewCell
											else { return UICollectionViewCell() }

					let newsData = newsListVM.newsAtIndex(indexPath.row)
					cell.setupViews(news: newsData)

				return cell
			}

	}
}
