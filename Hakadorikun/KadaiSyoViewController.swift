//
//  KadaiSyoViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/04/01.
//

import UIKit
import RealmSwift

//enum BorderPosition {
//    case top
//    case left
//    case right
//    case bottom
//}
//
//extension UIView {
//    /// 特定の場所にborderをつける
//        ///
//        /// - Parameters:
//        ///   - width: 線の幅
//        ///   - color: 線の色
//        ///   - position: 上下左右どこにborderをつけるか
//        func addBorder(width: CGFloat, color: UIColor, position: BorderPosition) {
//
//            let border = CALayer()
//
//            switch position {
//            case .top:
//                border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
//                border.backgroundColor = color.cgColor
//                self.layer.addSublayer(border)
//            case .left:
//                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
//                border.backgroundColor = color.cgColor
//                self.layer.addSublayer(border)
//            case .right:
//                print(self.frame.width)
//
//                border.frame = CGRect(x: self.frame.width - width, y: 0, width: width, height: self.frame.height)
//                border.backgroundColor = color.cgColor
//                self.layer.addSublayer(border)
//            case .bottom:
//                border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
//                border.backgroundColor = color.cgColor
//                self.layer.addSublayer(border)
//            }
//        }
//}

class KadaiSyoViewController: UIViewController, UITextViewDelegate{

    
    @IBOutlet weak var KadaiTitle: UILabel!
    @IBOutlet weak var Subject: UILabel!
    @IBOutlet weak var Deadline: UILabel!
    @IBOutlet weak var Memoview: UITextView!
    @IBOutlet weak var MojiCounter: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let realm = try! Realm()
        
        Memoview.delegate =  self as UITextViewDelegate
        
 //       let kadaiData = realm.objects(KadaiObj.self)
 //       print("全てのデータ\(kadaiData)")
        
//        self.Memoview.addBorder(width: 0.5, color: UIColor.gray, position: .bottom)
//        self.Memoview.addBorder(width: 0.5, color: UIColor.gray, position: .top)
        
        
//        Memoview.layer.borderColor = UIColor.gray.cgColor
//        Memoview.layer.borderWidth = 0.5
//        Memoview.layer.cornerRadius = 8.0
//        Memoview.layer.masksToBounds = true
        

        
//        KadaiTitle.text = "\(String(describing: kadaiData[0].kadai))"
        //Subject.text = "\(kadaiData[0].subject)"
        //Deadline.text = "\(kadaiData[0].deadline)"
        
        
        //konnnichiha
        
        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let MemoNum = Memoview.text.count
        MojiCounter.text = String(MemoNum)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
