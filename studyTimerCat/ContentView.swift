//
//  ContentView.swift
//  studyCat
//
//  Created by 90309356 on 2/3/23.
//
//
import SwiftUI

struct ContentView: View {
    @State var countDownTimer = 10
    @State var timerRunning = true
    
    @State var progressValue: Float = 0.0
    
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    @State private var showstudyView = true
    // @State private var showWelcomeView = false
    
    let skyBlue = Color(red: 0.95, green: 0.85, blue: 1.00)
    
    var body: some View {
        NavigationView {
            ZStack {
                skyBlue
                    .ignoresSafeArea()
                VStack {
                    
                    Menu  {
                        Menu ("Hats"){
                            Button ("Top Hat"){
                            }
                        }
                        Menu ("Accessories"){
                            Button ("Bow Tie"){
                            }
                        }
                        Menu ("Shoes"){
                            Button ("High Heels"){
                            }
                        }
                        Button("Close", role: .destructive){
                        }
                        
                        
                    } label: {
                        Label("Closet", systemImage: "bolt.fill")
                            .labelStyle(.titleOnly)
                        Image("new hnger")
                    }
                    //ProgressBar(progress: 50, lineWidth: 15).overlay{
                    
                    VStack{
                        Text("\(vm.time)")
                            .font(.system(size: 70, weight: .medium, design: .rounded))
                            .padding()
                        //.frame(width: width)
                        //.background(.thinMaterial)
                        //.cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.gray, lineWidth:4))
                        
                            .alert("Timer done!", isPresented:$vm.showingAlert){
                                Button("Continue", role: .cancel){
                                    //code
                                    
                                    /*
                                     Text("start button?")
                                     Text("\(countDownTimer)").onReceive(timer) { _ in
                                     if countDownTimer > 0 && timerRunning{
                                     countDownTimer -= 1
                                     
                                     } else{
                                     timerRunning = false
                                     }
                                     */
                                }//button
                            }//alert
                            .font(.system(size: 80, weight: .bold)).opacity(0.80)
                            .padding()
                        Slider(value: $vm.minutes, in: 1...60, step:1)
                            .padding()
                            .frame(width:width)
                            .disabled(vm.isActive)
                            .animation(.easeInOut, value: vm.minutes)
                        
                        HStack (spacing: 0.0001){
                            //Spacer()
                            //Spacer()
                            //Spacer()
                            //  Button ("Start"){
                            //(action: { showWelcomeView = true })
                            // vm.start(minutes: vm.minutes)
                            //} .disabled(vm.isActive)
                            //NavigationLink("", destination: studyView(), isActive: $showstudyView)
                            // .padding()
                            //Spacer()
                            //   Button("reset", action:vm.reset)
                            //    .tint(.red)
                            // .frame(width: width)
                            NavigationLink {
                                // destination view to navigation to
                                studyView()
                            } label: {
                                Text("Start Timer")
                                   // .foregroundColor(.gray)
                            }
                            
                        }//HStack
                        .onReceive(timer){ _ in
                            vm.updateCountDown()
                        }//onReceive
                        
                        
                        //ProgressBar(progress: 50, lineWidth: 15).overlay{
                        Spacer()
                        Spacer()
                        HStack {
                           Spacer()
                            Spacer()
                            Image("cat")
                        }
                        //Image("cat")
                        // } //2nd VStack closer
                    } //overlay closer
                } //1st Vstack closer
            } //body view closer
            
        }
    } //content view
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } //previews view vloser
} //content view previews closer
    
            
        
    

