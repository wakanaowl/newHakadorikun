//
//  MemoTableViewCell.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/05/03.
//

import UIKit

class MemoTableViewCell: UITableViewCell, UITextViewDelegate {


    @IBOutlet weak var textView: PlaceHolderTextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
        // Configure the view for the selected state
    }
    

}


