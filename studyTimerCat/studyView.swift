//
//  studyView.swift
//  studyTimerCat
//
//  Created by 90309356 on 3/2/23.
//

import SwiftUI

struct studyView: View {

  //  let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    

    let skyBlue = Color(red: 0.95, green: 0.85, blue: 1.00)

    var body: some View {
       
            
            ZStack{
                skyBlue
                    .ignoresSafeArea()
                VStack {
                    Menu  {
                        Menu ("hats"){
                            Button ("Top Hat"){
                            }
                        }
                        Menu ("clothes"){
                            Button ("Pink Shirt"){
                            }
                        }
                        Menu ("shoes"){
                            Button ("High Heels"){
                            }
                        }
                        Button("Close", role: .destructive){
                        }
                        
                        
                    } label: {
                        Label("menu", systemImage: "gearshape.fill")
                    }
                    VStack{
                        
                        Text("\(vm.time)")
                            .font(.system(size: 70, weight: .medium, design: .rounded))
                            .padding()
                    Spacer()
                    
                    ProgressBar(progress: 50, lineWidth: 15).overlay{
                        Image("lock")
                    }
                    
                    Image("cat2")
                }
                
            }
        }
    }
    
    struct studyView_Previews: PreviewProvider {
        static var previews: some View {
            studyView()
        }
    }
}
