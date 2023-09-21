//
//  HeadlineSectionCell.swift
//  KeywordNews
//
//  Created by terry on 2023/09/21.
//

import UIKit
import SnapKit
import Kingfisher

class HeadlineSectionCell: UICollectionViewCell {
	static let identifier = "HeadlineSectionCell"

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .systemGray4
		imageView.layer.cornerRadius = 8
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true

		return imageView
	}()

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 24, weight: .bold)
		label.numberOfLines = 0
		label.textColor = .white

		return label
	}()
	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupViews(headline: HeadlineVM) {
		[imageView, titleLabel].forEach {
			addSubview($0)
		}

		guard let imageURL = URL(string: headline.urlToImage ?? "") else { return }
		imageView.kf.setImage(with: imageURL)
		imageView.snp.makeConstraints {
			$0.leading.top.trailing.bottom.equalToSuperview().inset(8)
			$0.height.equalTo(600)
		}

		titleLabel.text = headline.title!
		titleLabel.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.leading.trailing.bottom.equalTo(imageView).inset(8)
		}
	}
}
