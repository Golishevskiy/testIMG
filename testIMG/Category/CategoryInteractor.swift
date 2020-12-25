//
//  CategoryInteractor.swift
//  testIMG
//
//  Created by Petro GOLISHEVSKIY on 14.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CategoryBusinessLogic {
    func makeRequest(request: Category.Model.Request.RequestType)
}

class CategoryInteractor: CategoryBusinessLogic {

  var presenter: CategoryPresentationLogic?
  var service: CategoryService?
  
    func makeRequest(request: Category.Model.Request.RequestType) {
    if service == nil {
      service = CategoryService()
    }
        
        switch request {

        case .printName(let name):
            print("hello " + name + "from Interactor")
            let newText = "hello " + name
            presenter?.presentData(response: Category.Model.Response.ResponseType.passData(text: newText))
        case .testCase:
            print("testCase")
        }
        

    
  }
  
}
