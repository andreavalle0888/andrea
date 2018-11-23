//
//  ViewController.swift
//  producto
//
//  Created by macbook on 21/11/18.
//  Copyright © 2018 potato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var scrollcontrol: UIScrollView!
    
    @IBOutlet weak var Calendario: UICollectionView!
    @IBOutlet weak var labelmeses: UILabel!
    
    let Meses = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre", "Diciembre"]
    let diasmes = ["Lunes","Martes","Miercoles","Jueves","Viernes"]
    let diasdelmes =  [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMes = String()
    
    
    var galeriaimagenes: [String] = ["1","2","3"]
    var frame = CGRect(x:0,y:0,width:0,height:0)
    
    var numero = Int()
    var siguientenumero = Int()
    var anteriornumero = 0
    var direccion = 0
    var posicion = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagecontrol.numberOfPages = galeriaimagenes.count
        for index in 0 ..< galeriaimagenes.count{
            frame.origin.x = scrollcontrol.frame.size.width * CGFloat(index)
            frame.size = scrollcontrol.frame.size
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: galeriaimagenes[index])
        }
      currentMes = Meses[month]
        labelmeses.text = "\(currentMes)\(year)"
        
        
    }

   

    @IBAction func siguiente(_ sender: Any) {
        switch currentMes {
        case "Diciembre":
            month = 0
            year += 1
             currentMes = Meses[month]
            labelmeses.text = "\(currentMes)\(year)"
            Calendario.reloadData()
        default:
            month += 1
            currentMes = Meses[month]
            labelmeses.text = "\(currentMes)\(year)"
            Calendario.reloadData()
        }
    }
  
    @IBAction func atras(_ sender: Any) {
        switch currentMes {
        case "Enero":
            month = 11
            year -= 1
            currentMes = Meses[month]
            labelmeses.text = "\(currentMes)\(year)"
            Calendario.reloadData()
        default:
            month -= 1
            currentMes = Meses[month]
            labelmeses.text = "\(currentMes)\(year)"
            Calendario.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diasdelmes[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendario", for: indexPath)as! FechasCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.fechalabel.text = "\(indexPath.row + 1)"
        return cell
        
    }
    
    
}

