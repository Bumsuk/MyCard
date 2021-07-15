//
//  PhotoPicker.swift
//  MyCards
//
//  Created by brown on 2021/07/14.
//

import SwiftUI
import PhotosUI

class MyClass {
    var name: String = ""
}

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    @Environment(\.presentationMode) var presentationMode
    
    class PhotosCoordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker
        
        init(parent: PhotoPicker) {
            self.parent = parent // 복사다 복사! 참조가 아니고!
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            print(#function, "사진선택됨!")
            let itemProviders = results.map(\.itemProvider)
            for item in itemProviders {
                // load the image from the item here
                if item.canLoadObject(ofClass: UIImage.self) {
                    item.loadObject(ofClass: UIImage.self) { image, error in
                        if let error = error {
                            print("Error!", error.localizedDescription)
                        } else {
                            DispatchQueue.main.async {
                                if let image = image as? UIImage {
                                    self.parent.images.append(image)
                                }
                            }
                        }
                    }
                }
            }
            
            parent._presentationMode.wrappedValue.wrappedValue.dismiss()
        }
    }
    
    func makeUIViewController(context: Self.Context) -> some UIViewController {
        var config = PHPickerConfiguration()
        config.filter = .any(of: [.images, .videos]) // 원래는 이미지만..
        config.selectionLimit = 0
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = context.coordinator // !
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: Self.UIViewControllerType, context: Self.Context) {
        
    }
    
    func makeCoordinator() -> PhotosCoordinator {
        PhotosCoordinator(parent: self)
    }
}


struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker(images: .constant([]))
    }
}
