//
//  AddView.swift
//  studyTimer
//
//  Created by 64006562 on 4/19/23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = " "
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
            }
            .padding(14)
            .navigationTitle("Add an Item")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }

    }
}
