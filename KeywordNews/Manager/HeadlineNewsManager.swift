//
//  HeadlineNewsManager.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import Foundation
import Alamofire

struct HeadlineNewsManager {
	func request(completionHandler: @escaping (([Article]) -> Void)) {
		guard
			let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=7b07a51413334240aca1435e2e39329e")
		else { return }

		AF.request(url, method: .get).responseDecodable(of: HeadlineResponseModel.self) { response in
			switch response.result {
			case .success(let result):
				completionHandler(result.articles!)
			case .failure(let error):
				print(error)
			}
		}

//		AF.request(url, method: .get).responseJSON { response in
//			switch response.result {
//			case .success(let result):
//				print(result)
////					let dirctory = result as? [String: Any]
////					print(dirctory)
//				do {
//					let dataJson = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
//					let JSONDecode = try JSONDecoder().decode(HeadlineResponseModel.self, from: dataJson)
//					print(JSONDecode)
//				} catch {
//					print(error)
//				}
//			case .failure(let error):
//				print(error)
//			}
//		}
	}
}
