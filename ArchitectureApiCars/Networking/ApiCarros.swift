//
//  ApiCarros.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 20/02/2019.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import Foundation
import Alamofire

class ApiCarros{
    static func fwetchCars(completion:@escaping(Result<Carros, Error>)->Void){
        if let url = URL(string: Constants.URL_BASE){
            let request = URLRequest(url: url)
            Alamofire.request(request).responseData { (response) in
                let statusCode = response.response?.statusCode
                switch statusCode{
                case 200:
                    do{
                        let jsonObject = try JSONDecoder().decode(CarrosResponse.self, from: response.data!)
                        completion(.Success(jsonObject.carros))
                    }catch{
                       print("erro desconhecido")
                    }
                default:
                       completion(.Error(response.error!))
                }
            }
        }
    }
}
