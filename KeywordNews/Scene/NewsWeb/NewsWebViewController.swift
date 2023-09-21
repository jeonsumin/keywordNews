//
//  NewsWebViewController.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import UIKit
import WebKit
import SnapKit

class NewsWebViewController: UIViewController {
	private let webView = WKWebView()
	var webSiteLink = ""

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .yellow
		setupWebView()
		setupNavigationBar()
	}

	func setupNavigationBar() {
		navigationItem.title = "News"
		}

	func setupWebView() {
		guard let linkUrl = URL(string: webSiteLink) else {
			navigationController?.popViewController(animated: true)
			return
		}

		view = webView
		let urlRequest = URLRequest(url: linkUrl)
		webView.load(urlRequest)
	}
}
