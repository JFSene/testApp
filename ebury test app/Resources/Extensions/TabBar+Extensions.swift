import UIKit
import SwiftUI

// Define colors for tab bar in light and dark mode
private let lightModeColor = UIColor(Color(hex: 0xF9F9F9))
private let darkModeColor = UIColor(Color(hex: 0x1C1C1E))

extension UITabBarController {
    
    // Override traitCollectionDidChange to handle trait changes
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Check if the appearance mode has changed
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateTabBarAppearance()
        }
    }
    
    // Function to update tabBar appearance based on current trait collection
    private func updateTabBarAppearance() {
        // Determine if the current appearance mode is dark
        let isDarkMode = traitCollection.userInterfaceStyle == .dark
        
        // Define colors for tab bar in light and dark mode
        let lightModeColor = UIColor(Color(hex: 0xF9F9F9))
        let darkModeColor = UIColor(Color(hex: 0x1C1C1E))
        
        // Set tabBar background color based on appearance mode
        tabBar.barTintColor = isDarkMode ? darkModeColor : lightModeColor
        
        // Update the shadow view color
        if let shadowView = view.subviews.first(where: { $0.accessibilityIdentifier == "TabBarShadow" }) {
            shadowView.backgroundColor = isDarkMode ? darkModeColor : lightModeColor
        }
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Determine if the current appearance mode is dark
        let isDarkMode = traitCollection.userInterfaceStyle == .dark
        
        // Get the current frame of the tabBar
        var tabBarFrame = tabBar.frame
        
        // Adjust the tabBar's frame to increase its height
        // Note: We need to adjust the 'y' position to maintain the tabBar at the bottom
        let screenHeight = UIScreen.main.bounds.height
        let tabBarHeight: CGFloat = screenHeight > 667 ? 100 : 70 // Use 100 for larger screens and 70 for smaller screens
        
        tabBarFrame.size.height = tabBarHeight
        tabBarFrame.origin.y = view.frame.size.height - tabBarHeight
        tabBar.frame = tabBarFrame
        
        // Enable masking to bounds to apply rounded corners
        tabBar.layer.masksToBounds = true
        
        // Set the corner radius for rounded corners
        tabBar.layer.cornerRadius = 16
        
        // Specify which corners to round
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Top left and top right corners
        
        // Check if a shadow view is already added
        if let shadowView = view.subviews.first(where: { $0.accessibilityIdentifier == "TabBarShadow" }) {
            // Update the shadow view's frame to match the new tabBar frame
            shadowView.frame = tabBar.frame
            // Update shadowView's background color based on appearance mode
            shadowView.backgroundColor = isDarkMode ? darkModeColor : lightModeColor
        } else {
            // Create and configure a new shadow view
            let shadowView = UIView(frame: tabBar.frame)
            shadowView.accessibilityIdentifier = "TabBarShadow" // Set an identifier for the shadow view
            
            // Set the background color based on appearance mode
            shadowView.backgroundColor = isDarkMode ? darkModeColor : lightModeColor
            
            // Set the corner radius and masked corners to match the tabBar
            shadowView.layer.cornerRadius = tabBar.layer.cornerRadius
            shadowView.layer.maskedCorners = tabBar.layer.maskedCorners
            
            // Disable masking to bounds to allow the shadow to be visible
            shadowView.layer.masksToBounds = false
            
            // Configure the shadow properties
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: 0.0, height: -8.0) // Offset to place the shadow above the tabBar
            shadowView.layer.shadowOpacity = 0.3 // Opacity of the shadow
            shadowView.layer.shadowRadius = 10 // Radius of the shadow
            
            // Add the shadow view to the view hierarchy
            view.addSubview(shadowView)
            
            // Bring the tabBar to the front to ensure it's above the shadow view
            view.bringSubviewToFront(tabBar)
        }
        
        // Set custom font size for tabBarItem titles
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)]
        
        // Apply the font attributes and adjust icon/title positions for each tabBarItem
        if let items = tabBar.items {
            for item in items {
                item.setTitleTextAttributes(fontAttributes, for: .normal)
                item.setTitleTextAttributes(fontAttributes, for: .selected)
                
                // Adjust the position of the icon
                item.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 10, right: 0)
                
                // Adjust the position of the title
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
            }
        }
    }
}
