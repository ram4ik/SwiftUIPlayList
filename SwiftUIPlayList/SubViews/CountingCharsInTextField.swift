//
//  CountingCharsInTextField.swift
//  SwiftUIPlayList
//
//  Created by ramil on 29.06.2020.
//

import SwiftUI

struct CountingCharsInTextField: View {
    @State private var text: String = ""
    
    var body: some View {
        ZStack(alignment: .trailing) {
            CounterView(text: $text)
                .padding()
                .frame(width: 60)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
            
            TextField("Username", text: $text)
                .padding(.trailing, 60)
                .padding(.leading, 10)
        }.background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
        .padding()
    }
}

struct CountingCharsInTextField_Previews: PreviewProvider {
    static var previews: some View {
        CountingCharsInTextField()
    }
}

struct CounterView: View {
    @Binding var text: String
    var counter: Int = 0
    
    init(text: Binding<String>) {
        self._text = text
        counter = self._text.wrappedValue.count
    }
    
    var body: some View {
        Text("\(counter)")
            .font(.caption)
            .foregroundColor(.gray)
    }
}
