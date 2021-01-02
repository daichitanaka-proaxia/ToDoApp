//
//  AddToDoView.swift
//  ToDoApp
//
//  Created by H5266 on 2021/01/02.
//

import SwiftUI

struct AddView: View {
    @State var item = ""
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var todoData:ToDoData
    
    var body: some View {
        VStack {
            TextField("タイトルを入力してください",text:$item).textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {

                self.todoData.items.append(self.item)
                self.presentaionMode.wrappedValue.dismiss()
              
                
            }, label: {
                Text("Save").foregroundColor(.white).fontWeight(.black).background(Color.blue).padding().cornerRadius(3)
            })
        }.padding()
    }
    
}


struct AddToDoView_Previews: PreviewProvider {
    static let todoData = ToDoData()
    static var previews: some View {
        AddView().environmentObject(todoData)
    }
}
