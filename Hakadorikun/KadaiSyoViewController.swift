//
//  KadaiSyoViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/04/01.
//

import UIKit

class KadaiSyoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var Memoview: UITextView!
    
    @IBOutlet weak var URLmemo: UITextView!
    
    @IBOutlet weak var MojiCounter: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Memoview.delegate =  self as? UITextViewDelegate
        
        Memoview.layer.borderColor = UIColor.gray.cgColor
        
        Memoview.layer.borderWidth = 1.0
        
        Memoview.layer.cornerRadius = 10.0
        Memoview.layer.masksToBounds = true
        
        URLmemo.layer.borderColor = UIColor.gray.cgColor
        
        URLmemo.layer.borderWidth = 1.0
        
        URLmemo.layer.cornerRadius = 10.0
        URLmemo.layer.masksToBounds = true
        
        

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
