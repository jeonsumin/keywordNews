//
//  NewsManager.swift
//  KeywordNews
//
//  Created by terry on 2023/09/20.
//

import Foundation
import Alamofire

struct NewsManager {
	func request(completionHandler: @escaping (([News]) -> Void)) {
		guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json") else { return }
		let headers: HTTPHeaders = [
			"X-Naver-Client-Id": "dzcPscaH2j6pHRfqtjSd",
			"X-Naver-Client-Secret": "F5Bcyx4vkU"
		]
		let parameters = RequestNewsModel(query: "아이폰")

		AF.request(url,
				   method: .get,
				   parameters: parameters,
				   headers: headers)
		.responseDecodable(of: NewsResponseModel.self) { response in
			switch response.result {
			case .success(let result):
					completionHandler(result.items)
			case .failure(let error):
					print(error)
			}
		}
	}
}
