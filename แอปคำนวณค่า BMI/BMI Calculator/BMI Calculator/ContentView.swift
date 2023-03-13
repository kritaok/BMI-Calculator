//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Kritanon Trachookul on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var status:String = ""
    @State var resultText:String = "คำนวณค่า BMI (สำหรับผู้ใหญ่)"
    @State var weight:String = ""
    @State var height:String = ""
    
    var body: some View {
        VStack {
            Text(status)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                
            VStack {
                
                Text(resultText)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                HStack {
                    Text("น้ำหนัก:")
                        .font(.title2)
                    TextField("กิโลกรัม", text: $weight)
                        .padding(.leading)
                        .frame(height: 30.0)
                }.padding().keyboardType(.numberPad)
                HStack {
                    Text("ส่วนสูง:")
                        .font(.title2)
                    TextField("เซนติเมตร", text: $height)
                        .padding(.leading)
                        .frame(height: 30.0)
                }.padding().keyboardType(.numberPad)
                
                Button("คำนวณ") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    let result = Double(self.weight)! / pow(Double(self.height)! / 100.0, 2)
                    self.resultText = String(result)
                    
                    if result < 18.5 {
                        self.status = "ผอม"
                    }
                    if result >= 18.5, result <= 25 {
                        self.status = "ปกติ"
                    }
                    if result > 25, result <= 30 {
                        self.status = "ท้วม"
                    }
                    if result > 30 {
                        self.status = "อ้วน"
                    }

                }.padding().frame(width: 125.0, height: 50.0).background(.blue).foregroundColor(.white).font(.title).cornerRadius(5)
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
