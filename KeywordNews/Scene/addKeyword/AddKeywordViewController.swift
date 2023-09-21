//
//  AddKeywordViewController.swift
//  KeywordNews
//
//  Created by deepvisions on 2023/09/21.
//

import UIKit

class AddKeywordViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground

		setupNavigation()
	}

	func setupNavigation() {
		title = "키워드 등록"
		let saveBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle"),
											style: .plain,
											target: self,
											action: #selector(tapSaveKeyword))

		let editBarButton = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"),
											style: .plain,
											target: self,
											action: #selector(tapSaveKeyword))

		navigationItem.rightBarButtonItems = [saveBarButton, editBarButton]

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"),
														   style: .plain,
														   target: self,
														   action: #selector(tapSaveKeyword))
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = "\(indexPath)"

		return cell
	}

	@objc func tapSaveKeyword() {
		self.dismiss(animated: true)
	}

	@objc func tapCancel() {
		self.dismiss(animated: true)
	}
}
