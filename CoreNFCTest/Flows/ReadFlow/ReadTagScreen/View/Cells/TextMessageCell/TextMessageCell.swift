//
//  TextMessageCell.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 16/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import ReactiveDataDisplayManager

final class TextMessageCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var separatorView: UIView!
    @IBOutlet private weak var textPayloadLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configurable

extension TextMessageCell: Configurable {

    func configure(with textPayload: TextPayload) {
        textPayloadLabel.text = textPayload.text
    }

}

// MARK: - Configuration

private extension TextMessageCell {

    func setupInitialState() {
        configureSeparatorView()
    }

    func configureSeparatorView() {
        separatorView.backgroundColor = .separator
    }

}
