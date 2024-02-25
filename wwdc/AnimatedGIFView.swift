//
//  AnimatedGIFView.swift
//  wwdc
//
//  Created by Michelle Han on 2/23/24.
//

import SwiftUI
import UIKit

struct AnimatedImageView: UIViewRepresentable {
    var imageName: String

    func makeUIView(context: Context) -> UIImageView {
        // Initialize the UIImageView without an image
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        if let gifImage = UIImage.gifImageWithName(imageName) {
            uiView.image = gifImage
        }
    }
}

