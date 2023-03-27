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
    @State var progressValue: Float = 0.0
 //   @State var timer= Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//timer needs to be a float?
    let skyBlue = Color(red: 0.95, green: 0.85, blue: 1.00)

    var body: some View {
       
            
            ZStack{
                skyBlue
                    .ignoresSafeArea()
                VStack {
                    Menu  {
                        Button ("End Timer") {
                            
                        }
                        Menu ("Add Break"){
                            Button ("5 Minute Breeak"){
                            }
                            Button ("7 Minute Break") {
                            }
                            Button ("10 Minute Break"){
                            }
                        }
                        
                        Button("Close", role: .destructive){
                        }
                        
                        
                    } label: {
                        Label("Pause", systemImage: "pause.fill")
                    }
                    VStack{
                        
                        Text("\(vm.time)")
                            .font(.system(size: 70, weight: .medium, design: .rounded))
                            .padding()
                    Spacer()
                    
                        ProgressBar(progress: $progressValue, timer: $timer)
                        ZStack {
                            //Image("food smaller")
                            Image("lock black")
                            
                            
                        
                        
                        
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
