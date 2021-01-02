//
//  AddToDoView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import SwiftUI

struct AddView: View {
    @State var todo = ""
    @State var showingAlert = false
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var todoData:ToDoData
    
    var body: some View {
        VStack {
            TextField("タイトルを入力してください",text:$todo).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button(action: {
                if canAdd(item: todo){
                todoData.add(item: ToDo(id: UUID(), title: todo))
                self.presentaionMode.wrappedValue.dismiss()
                }
            }){ buttonLabel }
        }
    }
    
    var buttonLabel: some View = Text("Save")
        .foregroundColor(Color.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    
    private func canAdd(item:String?) -> Bool{
        if item == "" { return false }
        if item == nil { return false }
        return true
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static let todoData = ToDoData()
    static var previews: some View {
        AddView().environmentObject(todoData)
    }
}
