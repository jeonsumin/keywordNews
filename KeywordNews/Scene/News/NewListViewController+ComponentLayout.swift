//
//  NewListViewController+ComponentLayout.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import UIKit
extension NewsListViewController {
	func layout() -> UICollectionViewLayout {
		return UICollectionViewCompositionalLayout { [weak self] section, environment in
			guard let self = self else { return nil}

			switch section {
			case 0:
				return self.setupDummySection()
			case 1:
				return self.setupKeywordSection()
			default:
				return self.setupNewsSection()
			}
		}
	}

	func setupDummySection() -> NSCollectionLayoutSection {
		// item
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = .init(top: 8, leading: 2, bottom: 8, trailing: 0)

		// group
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(300))
		let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)

		// section
		let section = NSCollectionLayoutSection(group: group)
		section.orthogonalScrollingBehavior = .continuous

		return section
	}

	func setupNewsSection() -> NSCollectionLayoutSection {
		// item
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = .init(top: 0, leading: 8, bottom: 8, trailing: 8)

		// group
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(68))
		let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)

		// section
		let section = NSCollectionLayoutSection(group: group)
		section.orthogonalScrollingBehavior = .none

		return section
	}

	func setupKeywordSection() -> NSCollectionLayoutSection {
		// item
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)

		// group
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)

		// section
		let section = NSCollectionLayoutSection(group: group)

		return section
	}
}
