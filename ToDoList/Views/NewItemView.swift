//
//  NewItemView.swift
//  ToDoList
//
//  Created by RaJ TiWaRi on 14/09/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 30)
            
            Form {
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // due date
                DatePicker("DueDate", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                                    
                // Button
                TLButton(
                    title: "Save",
                    background: .green
                ){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                        print(viewModel)
                    } else {
                        viewModel.showAlert = true
                    }
                    
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill all the field correctly.")
                )
            }
        }
    }
}


struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
