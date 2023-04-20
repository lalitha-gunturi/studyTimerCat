//
//  TaskContentView.swift
//  studyTimer
//
//  Created by 90310087 on 4/19/23.
//

import SwiftUI

struct TaskContentView: View {
     
     
    
    @State var items: [ItemModel ] = [
        ItemModel(title: "Click Edit to reorder tasks/prioritize them and delete taks", isComplated: true),
        ItemModel(title: "Task 1: Finish math homework", isComplated: true),
        ItemModel(title: "Task 2: Do the Laundry", isComplated: true),
        ItemModel(title: "Task 3: Order AP Books", isComplated: true),
        ItemModel(title: "Task 4: Clean my room" , isComplated: true),
        ItemModel(title: "Task 5: Walk the Dog", isComplated: true)
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
