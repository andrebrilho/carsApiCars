//
//  ViewController.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 20/02/2019.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControll: UIPageControl!
    
    var slides:[Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControll.currentPage = 0
        view.bringSubview(toFront: pageControll)
        getCarros()

    }
    

    func getCarros(){
        ApiCarros.fwetchCars { (result) in
            switch result {
            case let .Success(result):
                DispatchQueue.main.async {
                    self.createSlides(carros: (result?.carro)!)
                    self.setupSlide()
                    self.pageControll.numberOfPages = self.slides.count
                }
            case let .Error(error):
              Alert.showAlertError(mensagemErro: error.localizedDescription, titleMsgErro: "Ops", view: self)
            }
        }
    }
    
    func setupSlide(){
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func createSlides(carros:[Carro]){
        for i in 0 ..< carros.count {
            let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide.setCarro(carro: carros[i])
            slides.append(slide)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControll.currentPage = Int(pageIndex)
    }
}

