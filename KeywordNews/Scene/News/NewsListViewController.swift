//
//  NewsListViewController.swift
//  KeywordNews
//
//  Created by deepvisions on 2023/09/20.
//

import UIKit

class NewsListViewController: UICollectionViewController {
	var newsListVM: NewsListViewModel!
	var headlineListVM: HeadlineViewModel!

	override func viewDidLoad() {
		super.viewDidLoad()
		fetchNewsData()
		setupNavigation()
		setupCollectionView()
		fetchHeadlineData()

	}

	func fetchHeadlineData() {
		HeadlineNewsManager().request { article in
			self.headlineListVM = HeadlineViewModel(headline: article)
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}

	func fetchNewsData() {
		NewsManager().request { news in
			self.newsListVM = NewsListViewModel(news: news)
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}

	func setupNavigation() {
		title = "News"
		navigationController?.navigationBar.prefersLargeTitles = true
		let searchController = UISearchController()
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "k.circle"),
															style: .plain,
															target: self,
															action: #selector(tapRightBarButton))
	}

	func setupCollectionView() {
		collectionView.register(NewsListViewCell.self, forCellWithReuseIdentifier: NewsListViewCell.identifier)
		collectionView.register(HeadlineSectionCell.self, forCellWithReuseIdentifier: HeadlineSectionCell.identifier)
		collectionView.register(KeywordSection.self, forCellWithReuseIdentifier: KeywordSection.identifier)

		collectionView.collectionViewLayout = layout()
	}

	@objc func tapRightBarButton() {
		let addKeywordViewController = UINavigationController(rootViewController: AddKeywordViewController())
		addKeywordViewController.modalPresentationStyle = .fullScreen
		present(addKeywordViewController, animated: true)

	}
}
