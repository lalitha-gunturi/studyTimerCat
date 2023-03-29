//
//  Content-ViewModel.swift
//  studyCat
//
//  Created by Sophia Lin on 2/13/23.
//



import Foundation

extension studyView{
    final class ViewModel: ObservableObject{
        @Published var isActive = false
        @Published var showingAlert = false

     

        @Published var time: String = "60:00" // displayed time (the value that is shown in the timer)

        @Published var minutes: Float = 60.0{ //user selected minutes (slider)
            didSet{
                self.time = "\(Int(minutes)):00" //when user picks time, immediatly update the time (slider)
            }
        }
        private var initialTime = 0  //Used to keep track of the current time
        private var endDate = Date() //Used to keep track of the current time
        
        func start(minutes: Float){ //Start timer with the given minutes (has to be float bc slider requires float)
            self.initialTime = Int(minutes) // initial time set to the int of the minutes the user selects
            self.endDate = Date() // date of the time when the user starts the timer (time gets
            self.isActive = true // timer starts so is currentenly on
            self.endDate = Calendar.current.date(byAdding: .minute /* can change <<< to hour our minutes*/, value: Int(minutes), to: endDate)! // adding the user inputed minutes to the end date
        }
        
        func reset () { //resets the application to the initial state
            self.minutes = Float(initialTime)
            self.isActive = false //application no longer on
            self.time = "\(Int(minutes)):00" // you want it to be the same
        }
        
        func updateCountDown(){ //actually updates published value and format everything
            guard isActive else{return} // make sure isActive is true
            
            let now = Date() // current date
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970 // remaining time between now and the end time
            
            if diff <= 0{ //means count down is over
                self.isActive = false
                self.time = "0:00"
                self.showingAlert = true
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current //grab components from calendar
            let minute = calendar.component(.minute, from:date) // grab minutes from the components
            let second = calendar.component(.second, from:date) // grab seconds.  from the components
            //^^ needed to create string
            self.minutes = Float(minutes) //keep track of remaining minutes fromt the slider
            self.time = String(format:"%d:%02d", minute, second) // assign that to the string and formate. 
            
            
        }
    }
}

