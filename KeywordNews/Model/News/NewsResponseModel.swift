//
//  NewsResponseModel.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import Foundation

struct NewsResponseModel: Decodable {
	var items: [News] = []
}
