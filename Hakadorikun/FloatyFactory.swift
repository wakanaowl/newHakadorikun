//
//  FloatyFactory.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/09/26.
//

import Foundation
import UIKit
import Floaty

final class FloatyFactory : UIViewController{
    
    static func makeFloaty(vc: UIViewController & FloatyDelegate) -> Floaty {
        
        let fab = Floaty()
        
        fab.buttonColor = .orange
        fab.plusColor = .white
        
        //課題追加ボタン
        let KadaiItem = FloatyItem()
        KadaiItem.title = "課題を追加"
        fab.addItem(item: KadaiItem)
        
        //イベント追加ボタン
        let EventItem = FloatyItem()
        EventItem.title = "イベントを追加"
        fab.addItem(item: EventItem)
        
        
        return fab
        
    }
    
}

