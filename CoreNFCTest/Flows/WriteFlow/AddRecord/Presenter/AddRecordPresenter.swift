//
//  AddRecordPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import Foundation

final class AddRecordPresenter: AddRecordModuleInput {

    // MARK: - Properties

    weak var view: AddRecordViewInput?
    var router: AddRecordRouterInput?
    var output: AddRecordModuleOutput?

}

// MARK: - AddRecordModuleInput

extension AddRecordPresenter: AddRecordViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func typeSelected(type: NDEFWriteType) {
        router?.showAddURLMessage(output: self)
    }

}

// MARK: - URLMessageInputModuleOutput

extension AddRecordPresenter: URLMessageInputModuleOutput {

    func recordURLAdded(type: URIType, url: URL) {
        let uriMessage = URIMessage(uriType: type, url: url)
        output?.recordAdded(record: uriMessage)
    }

}
