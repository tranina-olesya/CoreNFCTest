//
//  URLMessageInputPresenter.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 17/02/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import Foundation

final class URLMessageInputPresenter: URLMessageInputModuleInput {

    // MARK: - Properties

    weak var view: URLMessageInputViewInput?
    var router: URLMessageInputRouterInput?
    var output: URLMessageInputModuleOutput?

    // MARK: - URLMessageInputModuleInput

}

// MARK: - URLMessageInputViewOutput

extension URLMessageInputPresenter: URLMessageInputViewOutput {

    func viewDidLoad() {
        view?.setupInitialState()
    }

    func readySelected(type: URIType, urlText: String) {
        guard let url = URL(string: urlText) else {
            return
        }
        output?.recordURLAdded(type: type, url: url)
        router?.popToInitial()
    }

}
