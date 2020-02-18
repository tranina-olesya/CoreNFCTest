//
//  ContactMessageCell.swift
//  CoreNFCTest
//
//  Created by Олеся Транина on 17/01/2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import ReactiveDataDisplayManager

final class ContactMessageCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var separatorView: UIView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configurable

extension ContactMessageCell: Configurable {

    func configure(with contactMessage: ContactMessage) {
        nameLabel.text = contactMessage.contact.namePrefix
        phoneLabel.text = contactMessage.contact.phoneNumbers.first?.value.stringValue
    }

}

// MARK: - Configuration

private extension ContactMessageCell {

    func setupInitialState() {
        configureSeparatorView()
    }

    func configureSeparatorView() {
        separatorView.backgroundColor = .separator
    }

}
