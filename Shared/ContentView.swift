//
//  ContentView.swift
//  Shared
//
//  Created by NTTDATA on 30/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button  {
                changeProfileImage = true
                openCameraRoll = true
            } label: {
                if changeProfileImage{
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image("avatar")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                }
            }
            Image(systemName: "plus")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(Circle())
        } //
        .sheet(isPresented: $openCameraRoll){
            ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
