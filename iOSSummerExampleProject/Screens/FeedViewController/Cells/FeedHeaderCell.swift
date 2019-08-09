//
//  FeedHeaderCell.swift
//  iOSSummerExampleProject
//
//  Created by Vladislav Krupenko on 09/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

final class FeedHeaderCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var headerImage: UIImageView!
    @IBOutlet private weak var imageAuthor: UILabel!
    @IBOutlet private weak var imageOverlay: UIView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureHeaderImage()
        configureAuthorLabel()
        configureOverlay()
    }

    // MARK: - Private configuration

    private func configureHeaderImage() {
        headerImage.contentMode = .scaleAspectFill
        headerImage.image = UIImage(named: "headerImage")
    }

    private func configureAuthorLabel() {
        imageAuthor.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        imageAuthor.textColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        imageAuthor.text = "Photo by Marcelo Cidrack"
    }

    private func configureOverlay() {
        imageOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

}
