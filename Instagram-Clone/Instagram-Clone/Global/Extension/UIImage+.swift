//
//  UIImage+.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/05/13.
//

import Foundation
import UIKit

extension UIImage {
    //사진의 메모리를 줄여주는 코드 
    static func load(named imageName : String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    func resize(length : CGFloat) -> UIImage? {
        let scale = length / self.size.width
        let height = self.size.height * scale
        let size = CGSize(width: length, height: height)
        let resizedImage = UIGraphicsImageRenderer(size: size).image {
            _ in draw(in: CGRect(origin: .zero, size: size)) }
        return resizedImage
    }
}
