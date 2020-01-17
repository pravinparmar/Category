//
//  ViewController.swift
//  aa
//
//  Created by Megha on 26/05/19.
//  Copyright © 2019 Megha. All rights reserved.
//

import UIKit

public class NonSubClass{
    
    public  func pubfool(){
    }
    
    open  func openbar(){
    }
    
    public final func finalbase(){
        
    }
}
open class SubClass{
    
    public  func pubfool(){
    }
    open  func openBar(){
    }
    public final func finalbase(){
        
    }
}
class subClassA: SubClass {

    override func pubfool() {
    }
    override func openBar() {
    }
}
var globaName  = ""

class ABC {
    static  var name = "Rakash...."
}
class ViewController: UIViewController {
    @IBOutlet weak var lblValue: UILabel!    
    @IBAction func ValueChnage(_ sender: UISlider) {
        print("value ==>\(sender.value)")
        let roundUP = round(sender.value/5) * 5
        print("roundUP ==>\(roundUP)")
        sender.value = roundUP
        //sliderVC.setValue(roundUP, animated: false)
        self.lblValue.text = "\(roundUP)"
        
    }
    
    @IBOutlet weak var sliderVC: UISlider!{
        didSet{
            sliderVC.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        }
    }
    @IBOutlet weak var BottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var CustomVc2: CustomView!
    @IBOutlet weak var lblWelcome: UILabel!
    var isPress:Bool = false
    @IBOutlet weak var bottomVC: UIView!
    @IBOutlet weak var topVC: UIView!
    var finstance :Fruit?
    var addNewvalue:String!{
        willSet{
            print("New ==\(newValue)")
        }
        didSet{
            print("Old ==>\(addNewvalue)")
        }
    }
    @IBAction func OnPressTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.10, delay: 0.01, options: .transitionFlipFromRight, animations: {
            if self.isPress == false{
                self.isPress = true
                self.BottomViewHeight.constant = 50
                self.view.layoutIfNeeded()
            }else{
                self.BottomViewHeight.constant = 0
                self.view.layoutIfNeeded()
                self.isPress = false
            }
        }, completion: { (success) in
            
        })
    }
    // MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
         self.sliderVC.maximumValue = 100
        self.sliderVC.minimumValue = 0
        
         finstance = Fruit.init(name: "Apple")
        print("==>\(ABC.name)")
         addNewvalue = "Add test abcc"
         let mean = self.arithmeticMean(numbers: 1,2,3,4,5,6)
        print("Mean ==>\(mean)")
        print("========")
        var arrDouble = [Double](repeating: 2.0, count: 5)
        print(" arrDouble ==>\(arrDouble)")
        //
        #if DEBUG
        print("Good......")
        #endif
        //
        CustomVc2.lblTitle.text = "Great!! Work...."
        CustomVc2.btnPress.addTarget(self, action: #selector(alertShow), for: .touchUpInside )
        //
        let age = 5
        assert(age > 1 , " Age not  less then <= 0")
    }
    override func viewWillAppear(_ animated: Bool) {
        //print(".......")
        self.lblWelcome.text = globaName
    }
    override func viewWillLayoutSubviews() {
        //print("=================>>")
        //print("viewWillLayoutSubviews...")
    }
    override func viewWillDisappear(_ animated: Bool) {
       // print("========disappear")
        finstance = nil

    }
    func arithmeticMean(numbers:Double...) -> Double{
        
        var Total:Double = 0.0
        for no in numbers {
            Total += no
        }
        return Total/Double(numbers.count)
        
    }
    //MARK:-
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("==>touchesBegan")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("==>touchesEnded")

    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("==>touchesCancelled")

    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("==>touchesMoved")
    }
    @IBAction func btnPress(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier:"SecondVC") as! SecondVC
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    @objc func alertShow(){
         let alert = UIAlertController.init(title: "", message: "Good Morning test", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK", style: .default) { (ok) in
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    deinit {
        print("deinit ==")
    }

}

class Fruit{
    var Fname:String?
    init(name:String) {
        Fname = name
        print("fname ==\(name) Init")
    }
    deinit {
        print("deinit Fruits ==>\(Fname)")

    }
}
