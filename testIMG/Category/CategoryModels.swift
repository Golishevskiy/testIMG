//
//  CategoryModels.swift
//  testIMG
//
//  Created by Petro GOLISHEVSKIY on 14.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Category {
   
  enum Model {
    struct Request {
      enum RequestType {
        case printName(name: String)
        case testCase
      }
    }
    struct Response {
      enum ResponseType {
        case passData(text: String)
        case formattData
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case printToConsole(stringForPrint: String)
      }
    }
  }
  
}
