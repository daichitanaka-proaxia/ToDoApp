//
//  EditView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import SwiftUI

struct EditView: View {
    @State var todo:ToDo
    @State var title:String
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var todoData:ToDoData
    
    var body: some View {
        VStack {
            TextField(todo.title, text: $title).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button(action: {
                if canUpdate(item: $title){
                    todoData.update(todo:todo,title:$title.wrappedValue)
                    self.presentaionMode.wrappedValue.dismiss()
                }
            }){ buttonLabel }
        }

    }
    
    var buttonLabel: some View = Text("Upadate")
        .foregroundColor(Color.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    
    private func canUpdate(item:Binding<String>) -> Bool{
        if item.wrappedValue == "" { return false }
        if item.wrappedValue == nil { return false }
        return true
    }
    
    
    
}

struct EditView_Previews: PreviewProvider {
    static let todoData = ToDoData()
    static var todo:ToDo = ToDo()
    static var previews: some View {
        EditView(todo: todo, title: todo.title).environmentObject(todoData)
    }
}
