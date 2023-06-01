//
//  studyView.swift
//  studyTimerCat
//
//  Created by 90309356 on 3/2/23.
//

import SwiftUI

struct studyView: View {
    @State private var totalTime: TimeInterval = 60 // Total time for the timer (default: 1 minute)
    @State private var currentTime: TimeInterval = 60 // Current time for the timer (default: 1 minute)
    @State private var timerRunning = false // Timer state
    @State var catImage = "cat"
    @State private var showCompletionPopup = false // State for showing the completion popup
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            ZStack {
                Circle()
                    .trim(from: 0, to: CGFloat(currentTime / totalTime))
                    .stroke(Color("DarkerPurple"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.linear)
                    .frame(width: 240, height: 240)
                
                VStack {
                    Text("Selected Time")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("DarkerPurple"))
                    
                    Text(timeString(time: currentTime))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("DarkerPurple"))
                }
            }
            .padding(.bottom, 20)
            
            HStack(spacing: 20) {
                Button(action: {
                    startTimer()
                }) {
                    Text("Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("DarkerPurple"))
                        .cornerRadius(10)
                }
                .disabled(timerRunning)
                
                Button(action: {
                    resetTimer()
                }) {
                    Text("Reset")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("DarkerPurple"))
                        .cornerRadius(10)
                }
                .disabled(!timerRunning)
            }
            
            Slider(value: $totalTime, in: 0...7200, step: 1)
                .accentColor(Color("DarkerPurple"))
                .padding(.horizontal)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack {
                Text("0 seconds")
                    .font(.subheadline)
                    .foregroundColor(Color("DarkerPurple"))
                
                Spacer()
                
                Text("2 hours")
                    .font(.subheadline)
                    .foregroundColor(Color("DarkerPurple"))
            }
            .padding(.horizontal)
            
            Text(selectedTimeString(time: totalTime))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color("DarkerPurple"))
                .padding(.bottom, 10)
            
            Image(catImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .foregroundColor(Color("DarkerPurple"))
            
        }
        .padding()
        .background(Color("Background"))
        .edgesIgnoringSafeArea(.all)
        .onReceive(timer) { _ in
            if timerRunning {
                if currentTime > 0 {
                    currentTime -= 1
                } else {
                    timerRunning = false
                    showCompletionPopup = true
                }
            }
        }
        .alert(isPresented: $showCompletionPopup) {
            Alert(
                title: Text("Great Job!"),
                message: Text("You completed your study session! Woohoo!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func startTimer() {
        currentTime = totalTime
        timerRunning = true
    }
    
    func resetTimer() {
        currentTime = totalTime
        timerRunning = false
    }
    
    func timeString(time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        let minutes = (Int(time) % 3600) / 60
        let hours = Int(time) / 3600
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func selectedTimeString(time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        let minutes = (Int(time) % 3600) / 60
        let hours = Int(time) / 3600
        
        return String(format: "Selected Time: %02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct studyView_Previews: PreviewProvider {
    static var previews: some View {
        studyView()
    }
}
