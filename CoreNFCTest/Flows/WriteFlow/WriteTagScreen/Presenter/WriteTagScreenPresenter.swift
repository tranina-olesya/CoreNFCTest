//
//  WriteTagScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

final class WriteTagScreenPresenter: WriteTagScreenModuleInput {

    // MARK: - Properties

    weak var view: WriteTagScreenViewInput?
    var router: WriteTagScreenRouterInput?
    var output: WriteTagScreenModuleOutput?

    private var messages: [NDEFMessage] = []

}

// MARK: - WriteTagScreenViewOutput

extension WriteTagScreenPresenter: WriteTagScreenViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func addRecordSelected() {
        router?.showAddRecordScreen(output: self)
    }

}

// MARK: - AddRecordModuleOutput

extension WriteTagScreenPresenter: AddRecordModuleOutput {

    func recordAdded(record: NDEFMessage) {
        messages.append(record)
        view?.updateMessages(messages)
    }

}
