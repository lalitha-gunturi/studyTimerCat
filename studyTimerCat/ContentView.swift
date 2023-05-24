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
    @State var catImage = "cat"
    
    @State var progressValue: Float = 0.0
    
    @StateObject var vm = ViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    @State private var showstudyView = true
    
    let skyBlue = Color(red: 0.95, green: 0.85, blue: 1.00)
    
    var body: some View {
        NavigationView {
            ZStack {
                skyBlue
                    .ignoresSafeArea()
                VStack {
                    NavigationLink {
                        TaskContentView()
                    } label: {
                        Label("",systemImage: "bolt.fill")
                            .labelStyle(.titleOnly)
                        Image("purple todolist")
                            
                        
                    }
                    
                    Menu  {
                        Menu ("Hats"){
                            Button ("Top Hat"){
                                if catImage == "top hat on cat"{
                                    catImage = "cat"
                                }else{
                                    catImage = "top hat on cat"
                                }
                            }
                            Button ("Beanie"){
                                if catImage == "beanie on cat"{
                                    catImage = "cat"
                                }else{
                                    catImage = "beanie on cat"
                                }
                            }
                            Button ("Cowboy Hat"){
                                if catImage == "cowboy hat on cat"{
                                    catImage = "cat"
                                }else{
                                    catImage = "cowboy hat on cat"
                                }
                            }
                        }
                        Menu ("Accessories"){
                            Button ("Collar"){
                                if catImage == "collar on cat"{
                                    catImage = "cat"
                                } else {
                                    catImage = "collar on cat"
                                }
                            }
                            Button ("Bowtie"){
                                if catImage == "bowtie on cat"{
                                    catImage = "cat"
                                } else {
                                    catImage = "bowtie on cat"
                                }
                            }
                            Button ("Glasses"){
                                if catImage == "glasses on cat"{
                                    catImage = "cat"
                                } else {
                                    catImage = "glasses on cat"
                                }
                            }
                        }
                        Menu ("Shoes"){
                            Button ("Boots"){
                                if
                                    catImage == "boots on cat" {
                                        catImage = "cat"
                                } else {
                                    catImage = "boots on cat"
                                }
                            }
                            Button ("Socks"){
                                if catImage == "socks on cat"{
                                    catImage = "cat"
                                } else {
                                    catImage = "socks on cat"
                                }
                            }
                            Button ("Ballet Shoes"){
                                if catImage == "ballet shoes on cat"{
                                    catImage = "cat"
                                } else {
                                    catImage = "ballet shoes on cat"
                                }
                            }
                        }
                        Button("Close", role: .destructive){
                        }
                        
                        
                    } label: {
                        Label("", systemImage: "bolt.fill")
                            .labelStyle(.titleOnly)
                        Image("purple closet")
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
                           
                            //DO STUFF HERE
                            NavigationLink {
                                studyView()
                            } label: {
                                Text("Start Timer")
                                
                            }
                            
                        }//HStack
                       // .onReceive(timer){ _ in
                           // vm.updateCountDown()
                        }//onReceive closer
                        
                        
                        //ProgressBar(progress: 50, lineWidth: 15).overlay{
                        Spacer()
                        Spacer()
                        HStack {
                           Spacer()
                            Spacer()
                            Image(catImage)
                                .resizable()
                                .scaledToFit()
                        }

                        // } //2nd VStack closer
                    } //overlay closer
                } //1st Vstack closer
            } //body view closer
            
        }
    } //content view



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    } //previews view vloser
} //content view previews closer
    
            
        
    

