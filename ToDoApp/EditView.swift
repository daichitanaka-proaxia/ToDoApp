//
//  EditView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import SwiftUI

struct EditView: View {
    @State var todo:String = ""
    @State var showingAlert = false
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var todoData:ToDoData
    
    var body: some View {
        VStack {
            TextField(todo,text:$todo).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button(action: {
                    let updateItem = $todo.wrappedValue
                    todoData.update(index:0,updateItem: updateItem)
                    self.presentaionMode.wrappedValue.dismiss()
            }){ buttonLabel }
        }

    }
    
    var buttonLabel: some View = Text("Upadate")
        .foregroundColor(Color.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    
    private func canUpdate(item:String?) -> Bool{
        if item == "" { return false }
        if item == nil { return false }
        return true
    }
    
    
}

struct EditView_Previews: PreviewProvider {
    static let todoData = ToDoData()
    static var todo:String = ""
    static var previews: some View {
        EditView(todo: todo).environmentObject(todoData)
    }
}
