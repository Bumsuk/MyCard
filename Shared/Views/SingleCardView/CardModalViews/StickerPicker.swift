//
//  StickerPicker.swift
//  MyCards
//
//  Created by brown on 2021/07/14.
//

import SwiftUI

struct StickerPicker: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var stickerNames: [String] = []
    @Binding var stickerImage: UIImage?
    
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(stickerNames, id: \.self) { name in
                    Image(uiImage: getImage(from: name))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture(perform: {
                            stickerImage = getImage(from: name)
                            presentationMode.wrappedValue.dismiss()
                        })
                }
            }
            .padding([.leading, .trailing], 10)
        }
        .onAppear {
            stickerNames = loadStickers()
        }
    }

    func loadStickers() -> [String] {
        var themes: [URL] = []
        var stickerNames: [String] = []

        let fileManager = FileManager.default
        if let resourcePath = Bundle.main.resourcePath,
           let enumerator = fileManager.enumerator(
               at: URL(fileURLWithPath: resourcePath + "/Stickers"),
               includingPropertiesForKeys: nil,
               options: [
                   .skipsSubdirectoryDescendants,
                   .skipsHiddenFiles
               ])
        {
            for case let url as URL in enumerator where url.hasDirectoryPath {
                themes.append(url)
            }
        }

        for theme in themes {
            if let files = try? fileManager.contentsOfDirectory(atPath: theme.path) {
                for file in files {
                    stickerNames.append(theme.path + "/" + file)
                }
            }
        }

        return stickerNames
    }

    func getImage(from path: String) -> UIImage {
        print("loading:", path)
        return UIImage(named: path)
            ?? UIImage(named: "error-image")
            ?? UIImage()
    }
}

struct StickerPicker_Previews: PreviewProvider {
    @Environment(\.presentationMode) var presentationMode
    
    static var previews: some View {
        Group {
            StickerPicker(stickerImage: .constant(.init()))
        }
        //.previewLayout(.fixed(width: 818, height: 414))
    }
}
