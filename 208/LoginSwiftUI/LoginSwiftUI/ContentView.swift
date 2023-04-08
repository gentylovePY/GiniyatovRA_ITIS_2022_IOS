//
//  ContentView.swift
//  LoginSwiftUI
//
//  Created by Роман Гиниятов on 07.04.2023.
//

import SwiftUI
struct ContentView: View {

    @State var username: String = ""
    @State var password: String = ""
    @State var success: Bool = false
    @State var fail: Bool = false

    var body: some View {
        
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                TextField("Username",text: $username)
                    .padding(10)
                    .background(.white)
                    .cornerRadius(10)
                    .autocorrectionDisabled()
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal)
                
                HStack {
                    SecureField("Password", text: $password)
                        .autocorrectionDisabled()
                        .keyboardType(.asciiCapable)
                        .padding(10)
                        .background(.white)
                        .cornerRadius(10)
                    
                }.padding(.horizontal)
                
                
                Button {
                    authenticateUser(username: username, password: password)
                } label: {
                    Text("Sign In")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding()
            }
            .alert("You are successfully logged in", isPresented: $success) {
                Button("OK") { }
            }
            .alert("Incorrect login or password", isPresented: $fail) {
                Button("Clear") {
                    username = ""
                    password = ""
                }
                Button("Clear Username") {
                    username = ""
                }
                Button("Clear Password") {
                    password = ""
                }
            }
        }
    }

    func authenticateUser(username: String, password: String) {
        if username == "123" && password == "123" {
            success = true
        } else {
            fail = true
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
