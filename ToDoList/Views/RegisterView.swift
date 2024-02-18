//
//  RegisterView.swift
//  ToDoList
//
//  Created by RaJ TiWaRi on 14/09/23.
//
import Foundation
import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {VStack{
        // Header
        HeaderView(title:"To Do List" ,
                    subtitle: "Get things done",
                    angle: -15,
                    background: .green)
        
        Form{
            TextField("Full Name", text: $viewModel.name )
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            TextField("Email Address", text: $viewModel.email )
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password )
                .textFieldStyle(DefaultTextFieldStyle())
            
            TLButton(title: "Create Account",
                     background: .blue
            ){
                //Attemp r egistration
                viewModel.register()
            }

        }
        .offset(y:-50)
        
        Spacer()
    }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
