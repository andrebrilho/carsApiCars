//
//  Slide.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 05/03/19.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import UIKit
import AlamofireImage

class Slide:UIView {
    
    @IBOutlet weak var imgCar: UIImageView!
    @IBOutlet weak var lblNameCar: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    
    
    func setCarro(carro:Carro){
        lblNameCar.text = carro.nome
        txtDesc.text = carro.desc
        actIndicator.startAnimating()
        imgCar.af_setImage(withURL: URL(string:carro.url_foto!)!, filter: AspectScaledToFitSizeFilter(size: imgCar.frame.size), imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true, completion: { (_) in
            self.actIndicator.stopAnimating()
        }
        )}
}
