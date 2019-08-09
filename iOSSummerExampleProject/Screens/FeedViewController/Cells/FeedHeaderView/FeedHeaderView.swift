//
//  FeedHeaderView.swift
//  iOSSummerExampleProject
//
//  Created by Vladislav Krupenko on 09/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class FeedHeaderView: UITableViewHeaderFooterView {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - UITableViewHeaderFooterView

    override func awakeFromNib() {
        super.awakeFromNib()
        configureLable()
    }

    // MARK: - Internal Methods

    func configure(title: String) {
        titleLabel.text = title
    }

    // MARK: - Private Configuration

    private func configureLable() {
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.textColor = UIColor.black
        titleLabel.text = nil
    }

}
