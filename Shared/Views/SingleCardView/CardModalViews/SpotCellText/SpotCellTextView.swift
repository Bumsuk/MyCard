//
//  SpotCellTextView.swift
//  MyCards
//
//  Created by brown on 2021/07/14.
//

import SwiftUI

struct SpotCellTextView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let label = UILabel()
        label.text = "헬로우! UIKit11!"
        label.layer.cornerRadius = 30.0
        label.backgroundColor = .red
        
        let cell = UITableViewCell()
        cell.largeContentTitle = "타이틀!"
        cell.textLabel?.text = "헬로우! UIKit22!"
        cell.accessoryView = label
        
        
        let nib = UINib(nibName: "MessageTableViewCell", bundle: nil)
        let cellView = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        
        
        return cellView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}


struct SpotCellTextView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(0..<100) { num in
                SpotCellTextView()
                    .frame(height: 100)
                    .onTapGesture(perform: {
                        print("과연 되나?? 탭 이벤트!")
                    })
            }
        }
    }
}
