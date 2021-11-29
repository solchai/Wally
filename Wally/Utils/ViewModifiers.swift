//
//  ViewModifiers.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-28.
//

import Foundation
import SwiftUI

struct ColorPickerWarningView: View {
    @Binding var color: Color?
    @Binding var showWarning: Bool
    @State var showColorPicker = false
    @State var pickedColor = Color.yellow
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text("What's your favorite color?")
                    .font(.system(size: 13, weight: .medium))
                Text("We want to know your taste and change our look to make your experience as enjoyable as possible!")
                    .font(.system(size: 11))
                Image(systemName: "circle.grid.cross.up.fill") // TODO: change to asset that shows changing color changes accent color
                
                Spacer()
                
                Divider()
                
                HStack {
                    Button {
                        showWarning = false
                    } label: {
                        HStack {
                            Text("Pick Now")
                                .font(.system(size: 12, weight: .medium))
                            ColorPicker("Pick your favorite!", selection: $pickedColor)
                        }
                    }

                    Divider()
                    
                    Button {
                        showWarning = false
                    } label: {
                        Text("Later")
                            .font(.system(size: 12))
                    }

                }
            }
            .padding()
        }
        .cornerRadius(5)
//        .sheet(isPresented: $showColorPicker) {
//            color = pickedColor
//            showWarning = false
//            showColorPicker = false
//        } content: {
//            ColorPicker("Pick your favorite!", selection: $pickedColor)
//        }
    }
}

struct ColorPickerWarning: ViewModifier {
    @Binding var color: Color?
    @Binding var showWarning: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if showWarning {
                Group {
                    Color(red: 0, green: 0, blue: 0, opacity: 0.2)
                        .ignoresSafeArea()
                    ColorPickerWarningView(color: $color, showWarning: $showWarning)
                        .frame(width: 300, height: 400)
                }
            }
        }
    }
}
