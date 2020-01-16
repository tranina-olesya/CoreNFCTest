//
//  URIMessageCell.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import ReactiveDataDisplayManager

final class URIMessageCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var uriLabel: UILabel!
    @IBOutlet private weak var separatorView: UIView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configurable

extension URIMessageCell: Configurable {

    func configure(with uriPayload: URIPayload) {
        uriLabel.text = uriPayload.url.absoluteString
    }

}

// MARK: - Configuration

private extension URIMessageCell {

    func setupInitialState() {
        configureSeparatorView()
    }

    func configureSeparatorView() {
        separatorView.backgroundColor = .separator
    }

}
