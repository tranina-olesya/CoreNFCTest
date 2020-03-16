//
//  TextMessageScreenPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

final class TextMessageScreenPresenter {

    // MARK: - Properties

    weak var view: TextMessageScreenViewInput?
    var router: TextMessageScreenRouterInput?
    var output: TextMessageScreenModuleOutput?
}

// MARK: - TextMessageScreenViewOutput

extension TextMessageScreenPresenter: TextMessageScreenViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func readySelected(text: String) {
        output?.recordTextAdded(text: text)
        router?.popToInitial()
    }

}

// MARK: - TextMessageScreenModuleInput

extension TextMessageScreenPresenter: TextMessageScreenModuleInput {
}
