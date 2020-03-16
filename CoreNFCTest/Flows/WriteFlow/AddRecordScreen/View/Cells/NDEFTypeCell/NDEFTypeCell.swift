//
//  NDEFTypeCell.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17.02.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import ReactiveDataDisplayManager

final class NDEFTypeCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var typeLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

// MARK: - Configurable

extension NDEFTypeCell: Configurable {

    func configure(with model: NDEFWriteType) {
        typeLabel.text = model.title
    }

}

// MARK: - Configuration

private extension NDEFTypeCell {

}
