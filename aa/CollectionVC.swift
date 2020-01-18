//
//  CollectionVC.swift
//  aa
//
//  Created by Megha on 22/12/19.
//  Copyright © 2019 Megha. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation

class CollectionVC: UIViewController {
    @IBOutlet weak var collectionVC: UICollectionView!
    @IBOutlet weak var cl2: UICollectionView!
    var timer = Timer()
    var locationManager = CLLocationManager()
    var montionManager = CMMotionManager()
    
   // var completionString:((String)->(Void))?

    //MARK:- UIView method
    var arrImage = ["n1","n2","n3","n4","n5"]
    var images = ["s1","n2","n3","n1","s1","n2","n3"]
    override func viewDidLoad() {
        print("get ........")
        print("")
        let instance = SecondVC()
        let value  =  instance.completionString
        print("value==>\(value)")
//        let result = completionString
//        print("==>\(result)")
        super.viewDidLoad()
        self.TimerCount()
        
    }
    func TimerCount(){
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getSpeed), userInfo: nil, repeats: true)
    }
    @objc func getSpeed(){
        var  speed = CLLocationSpeed()
        speed = ((locationManager.location?.speed ?? 0))
        let km = Double(speed ?? 0 * 3.6)
        print("km  ==>\(km)")
        if (km * 3.6 > 10){
            if montionManager.isAccelerometerAvailable{
                let queue = OperationQueue()
                montionManager.startAccelerometerUpdates(to: queue) { (data, error) in
                    print("Data \(data)")
                    print("Error----\(error)")
                    guard let  resData = data else {
                        return
                    }
                    print("== \(resData.acceleration.x)")
                    print("== \(resData.acceleration.y)")
                    print("== \(resData.acceleration.z)")
                }
            }
            
        
        }else{
            print("Accelometer is not available. ")
        }
        
    }
    func goof(){
        print("good job.......")
    }
}
extension CollectionVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return self.arrImage.count

        }else{
            return self.images.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collectioncell1", for: indexPath) as! Collectioncell1
        if collectionView.tag == 1{
              cell.imgPhoto.image = UIImage.init(named:self.arrImage[indexPath.row])
        }else{
              cell.imgPhoto.image = UIImage.init(named:self.images[indexPath.row])
        }
        return cell
        
    }
}
extension CollectionVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return  10
    }
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1{
            return  CGSize.init(width: self.collectionVC.frame.width, height: self.collectionVC.frame.height)
        }else{
            return  CGSize.init(width:100 , height: 100)
        }
    }
   // func collectionviewA
}
class Collectioncell1:UICollectionViewCell{
    @IBOutlet weak var  imgPhoto:UIImageView!
}
