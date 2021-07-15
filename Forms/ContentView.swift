//
//  ContentView.swift
//  Forms
//
//  Created by Adityaa Mehra on 15/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var email = ""
    @State var darkmode = false
    @State var date:Date
    @State var selected = ""
    var options = ["option 1" , "option 2" , "option 3" , "option 4" ,"option 5" , ]
    var body: some View {
        //MARK:Use of NavigationView when we have to use picker inside of a form
        
        NavigationView {
            Form{
                Text("Hello, world!")
                Section(header: Text("Details")){
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }
                Section(header: Text("Settings")){
                    Toggle(isOn: $darkmode, label: {
                        Text("Dark Mode")
                    })
                    DatePicker("Select a date", selection: $date , displayedComponents: .date).datePickerStyle(GraphicalDatePickerStyle())
                    Picker("Select an option", selection: $selected) {
                        ForEach(options , id: \.self){op in
                            Text(op)
                        }
                    }
                }
                Button("Save") {
                    //
                }
            }.navigationBarTitle("Form")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(date: Date())
    }
}
