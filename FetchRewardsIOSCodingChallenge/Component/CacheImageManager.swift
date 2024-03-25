
import Foundation
import UIKit

class CacheImageManager {
    
    static let imageManager = CacheImageManager()
    
    var imageCacheManager: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * (50)
        return cache
    }()
    
    func add(image: UIImage, mealName: String) {
        imageCacheManager.setObject(image, forKey: mealName as NSString)
    }
    
    func get(mealName: String) -> UIImage? {
        return imageCacheManager.object(forKey: mealName as NSString)
    }
}
