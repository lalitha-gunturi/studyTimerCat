//
//  TaskContentView.swift
//  studyTimer
//
//  Created by 90310087 on 4/19/23.
//

import SwiftUI

struct TaskContentView: View {
     
     
    
    @State var items: [ItemModel ] = [
        ItemModel(title: "This is first title", isComplated: false),
        ItemModel(title: "This is second title", isComplated: true),
        ItemModel(title: "Third", isComplated: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete (perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Your Tasks!!")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView())
                            )
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from:IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
}

struct TaskContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskContentView()
    }
}
