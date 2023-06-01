//
//  ContentView.swift
//  studyCat
//
//  Created by 90309356 on 2/3/23.

//
import SwiftUI

struct ContentView: View {
    @State var countDownTimer = 10
    @State var timerRunning = true
    @State var catImage = "cat"
    
    @State var progressValue: Float = 0.0
    
    let backgroundColor = Color("Background")
    let darkerPurple = Color("DarkerPurple")
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    @State private var showstudyView = true
    
    let skyBlue = Color(red: 0.95, green: 0.85, blue: 1.00)
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                Spacer()
                VStack {
                    HStack {
                        NavigationLink {
                            TaskContentView()
                        } label: {
                            Label("", systemImage: "bolt.fill")
                                .labelStyle(.titleOnly)
                            Text("Tasks")
                                .frame(width: 90, height: 40)
                                .background(darkerPurple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Menu {
                            Button("hiking outfit") {
                                catImage = "cat hiking outfit"
                            }
                            Button("winter outfit") {
                                catImage = "cat winter outfit"
                            }
                            Button("business outfit") {
                                catImage = "cat business outfit"
                            }
                            Button("Close", role: .destructive) {
                            }
                        } label: {
                            Label("", systemImage: "bolt.fill")
                                .labelStyle(.titleOnly)
                            Text("Closet")
                                .frame(width: 90, height: 40)
                                .background(darkerPurple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom, 0) // Lower the buttons
                    
                    VStack {
                        NavigationLink(destination: studyView()) {
                            Text("Start Studying!!")
                                .frame(width: 250, height: 50)
                                .background(darkerPurple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.top, 8) // Lower the button
                        
                        Image("title2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 360, height: 360) // Adjust the size of the "title" asset
                        
                        
                        HStack {
                            
                            
                            Image(catImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 290, height: 290) // Adjust the size of the cat image
                            
                            
                        }
                        .frame(maxWidth: .infinity) // Center the cat image horizontally
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

