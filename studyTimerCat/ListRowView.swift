//
//  ListRowView.swift
//  studyTimer
//
//  Created by 64006562 on 4/19/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
            HStack{
                Image(systemName: item.isComplated ? "checkmark.circle" : ".circle")
                    .foregroundColor(item.isComplated ? .green : .red)
                Text(item.title)
                Spacer()
            } 
            .font(.title2)
            .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "first item", isComplated: false)
    static var item2 = ItemModel(title: "second item", isComplated: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
