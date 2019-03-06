//
//  ViewController.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 20/02/2019.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    var tableViewCarDatasourceAndDelegate:TableCarDatasourceAndDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCarros()
        tableViewCarDatasourceAndDelegate = TableCarDatasourceAndDelegate(infoTbl: tbl, viewControllerToPress: self)
    }
    

    func getCarros(){
        ApiCarros.fwetchCars { (result) in
            switch result {
            case let .Success(result):
                DispatchQueue.main.async {
                    self.tableViewCarDatasourceAndDelegate?.dados = (result?.carro!)!
                    self.tbl.reloadData()
                }
            case let .Error(error):
              Alert.showAlertError(mensagemErro: error.localizedDescription, titleMsgErro: "Ops", view: self)
            }
        }
    }
}

