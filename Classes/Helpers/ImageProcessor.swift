//
//  ImageProcessor.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/7/23.
//

import UIKit
//import MLKitSegmentationSelfie
//import MLKitVision

enum ProcessImageError: Error {
    case resizeError
    case compressError
}

class ImageProcessor {
    
    // MARK: - Properties
    
//    private var segmenter: Segmenter?
    
    // MARK: - Public methods
    
    func processImage(_ image: UIImage, completion: @escaping (UIImage?) -> Void) throws {
        var selectedImage = image
        if let imageData = selectedImage.jpegData(compressionQuality: 1) {
            let megaBytes = Double(imageData.count) / 1024 / 1024
            if megaBytes > 50.0 {
                guard let resizedImage = resizeImage(selectedImage) else {
                    throw ProcessImageError.resizeError
                }
                guard let compressedImage = compressImage(resizedImage) else {
                    throw ProcessImageError.compressError
                }
                selectedImage = compressedImage
            }
        }
        completion(selectedImage)
    }
    
    private func resizeImage(_ image: UIImage) -> UIImage? {
        let maxWidth: CGFloat = 1000
        let maxHeight: CGFloat = 1000
        
        let size = image.size
        let width = size.width
        let height = size.height
        
        if width > height && width <= maxWidth {
            return image
        }
        
        if height > width && height <= maxHeight {
            return image
        }
        
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if width > height {
            let ratio = maxWidth / width
            newWidth = maxWidth
            newHeight = height * ratio
        } else {
            let ratio = maxHeight / height
            newWidth = width * ratio
            newHeight = maxHeight
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    private func compressImage(_ image: UIImage) -> UIImage? {
        let compressionQuality: CGFloat = 0.8
        if let imageData = image.jpegData(compressionQuality: compressionQuality) {
            let megaBytes = Double(imageData.count) / 1024 / 1024
            if megaBytes < 30.0 {
                if let compressedImage = UIImage(data: imageData) {
                    return compressedImage
                }
            }
            return nil
        }
        return nil
    }
    
//    func processImage(_ image: UIImage, completion: @escaping (UIImage?) -> Void) {
//        Task {
//            do {
////                let resizedImage = try await resizeImage(image)
////                let compressedImage = try await compressImage(resizedImage)
////                let processedImage = try await removeBackground(from: compressedImage)
//                completion(image)
//            } catch {
//                print("Image processing failed with error: \(error)")
//                completion(nil)
//            }
//        }
//    }
    
    // MARK: - Private methods
    
//    private func compressImage(_ image: UIImage) async throws -> UIImage {
//        let compressionQuality: CGFloat = 0.8
//        if let imageData = image.jpegData(compressionQuality: compressionQuality) {
//            if let compressedImage = UIImage(data: imageData) {
//                return compressedImage
//            }
//        }
//        return image
//    }
//    
//    private func resizeImage(_ image: UIImage) async throws -> UIImage {
//        let maxSize: CGFloat = 1000
//        let imageSize = image.size
//        let width = imageSize.width
//        let height = imageSize.height
//        
//        if width > height && width > maxSize {
//            let newWidth = maxSize
//            let newHeight = (height / width) * maxSize
//            let newSize = CGSize(width: newWidth, height: newHeight)
//            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//            image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
//            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//            return resizedImage ?? image
//        } else if height > width && height > maxSize {
//            let newHeight = maxSize
//            let newWidth = (width / height) * maxSize
//            let newSize = CGSize(width: newWidth, height: newHeight)
//            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//            image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
//            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//            return resizedImage ?? image
//        }
//        return image
//    }
    
//    private func removeBackground(from image: UIImage) async throws -> UIImage {
//        let options = SelfieSegmenterOptions()
//        options.segmenterMode = .singleImage
//        segmenter = Segmenter.segmenter(options: options)
//        
//        let visionImage = VisionImage(image: image)
//        visionImage.orientation = image.imageOrientation
//        
//        var processedImage = image
//        
//        segmenter?.process(visionImage) { (mask, error) in
//            guard error == nil else {
//                print("Failed to process image with error: \(error!.localizedDescription).")
//                return
//            }
//            
//            guard let maskBuffer = mask?.buffer else {
//                print("Failed to get segmentation mask.")
//                return
//            }
//            
//            let maskWidth = CVPixelBufferGetWidth(maskBuffer)
//            let maskHeight = CVPixelBufferGetHeight(maskBuffer)
//            CVPixelBufferLockBaseAddress(maskBuffer, CVPixelBufferLockFlags.readOnly)
//            let maskBytesPerRow = CVPixelBufferGetBytesPerRow(maskBuffer)
//            let maskBaseAddress = CVPixelBufferGetBaseAddress(maskBuffer)!
//            
//            let threshold: Float32 = 0.8
//            let backgroundColor: UIColor = .black
//            
//            UIGraphicsBeginImageContextWithOptions(image.size, true, image.scale)
//            guard let context = UIGraphicsGetCurrentContext() else {
//                print("Failed to create graphics context.")
//                return
//            }
//            
//            image.draw(at: .zero)
//            
//            for row in 0..<maskHeight {
//                let rowData = maskBaseAddress + row * maskBytesPerRow
//                let data = rowData.bindMemory(to: Float32.self, capacity: maskWidth)
//                for col in 0..<maskWidth {
//                    let foregroundConfidence = data[col]
//                    if foregroundConfidence <= threshold {
//                        let pixelRect = CGRect(x: col, y: row, width: 1, height: 1)
//                        context.setFillColor(backgroundColor.cgColor)
//                        context.fill(pixelRect)
//                    }
//                }
//            }
//            processedImage = UIGraphicsGetImageFromCurrentImageContext() ?? image
//            UIGraphicsEndImageContext()
//        }
//        return processedImage
//    }
    
}
