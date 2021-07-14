//
//  StickerPicker.swift
//  MyCards
//
//  Created by brown on 2021/07/14.
//

import SwiftUI

struct StickerPicker: View {
    @State private var stickerNames: [String] = []

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(stickerNames, id: \.self) { sticker in
                    Image(uiImage: getImage(from: sticker))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
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
    static var previews: some View {
        StickerPicker()
    }
}
