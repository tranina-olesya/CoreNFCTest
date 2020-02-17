//
//  AddRecordPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

final class AddRecordPresenter: AddRecordModuleInput {

    // MARK: - Properties

    weak var view: AddRecordViewInput?
    var router: AddRecordRouterInput?
    var output: AddRecordModuleOutput?

    // MARK: - AddRecordModuleInput

}

extension AddRecordPresenter: AddRecordViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func typeSelected(type: NDEFWriteType) {
        output?.recordAdded(record: TextMessage(languageCode: "en", text: "aaaaaa"))
    }

}
