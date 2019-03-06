//
//  Result.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 20/02/2019.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import Foundation

enum Result<Carros, Error>{
    case Success(Carros?)
    case Error(Error)
}
