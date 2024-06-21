import SwiftUI

struct ConstantsStore: EnvironmentKey {
    static let defaultValue = ConstantsStore()
    
    // HeaderView strings and Constraints Value
    let lightModeImage = "bg-light"
    let darkModeImage = "bg-dark"
    let accountIcon = "accountIcon"
    let welcome = "Welcome"
    let companyName = "Company Name"
    let zeroValue: CGFloat = 0.0
    let mainVStackSpacing: CGFloat = 80.0
    let mainVStackBottonPadding: CGFloat = 60.0
    let iconWidthHeight: CGFloat = 35.0
    let iconPaddingTop: CGFloat = 50.0
    let leadingPadding: CGFloat = 16.0
    let internalVStackSpacing: CGFloat = 8.0
    let internalVStackBottonPadding: CGFloat = 70.0
    // AccountListView
    let listTitle = "Your currencies"
    let viewAllButton = "View all"
    let lazyVStackSpacing: CGFloat = 8.0
    let titlePaddingLeading: CGFloat = 24.0
    let internalHstackHeight: CGFloat = 60.0
    let listPrefixValue = 3
    let listItemLineSpacing: CGFloat = 10.0
    let listItemPaddingHorizontal: CGFloat = 12.0
    let listCornerRadius: CGFloat = 20
    let listShadowRadius: CGFloat = 10
    // ListItemComponent
    let itemImageFrame: CGFloat = 40
    let itemPadding: CGFloat = 8
    let itemCornerRadius: CGFloat = 8
    let itemHStackHorizontalPadding: CGFloat = 8
    let itemHStackVerticalPadding: CGFloat = 4
    // HomeView
    let headerViewHeight: CGFloat = 340
    let accountsListViewTopPadding: CGFloat = -100.0
    // TabBar
    let tabBarWalletTitle = "Wallet"
    let tabBarWalletIcon = "wallet-icon"
    let tabBarProductsTitle = "Products"
    let tabBarProductsIcon = "star-icon"
    // SplashScreen
    let ssLight = "splashscreen-light"
    let ssDark = "splashscreen-dark"
    let ssTitle = "Test App"
    //NoNetworkView
    let noNetworkVStackSpacing: CGFloat = 20.0
    let titleText = "Internet status:"
    let noWifiImage = "wifi.slash"
    let noWifiMainText = "There seems to be a problem with your Network Connection"
    let noNetworkWidth: CGFloat = 400
    let spacerHeight: CGFloat = 125
    // ProdcutsView
    let emptyStateImageLight = "emptystate-light"
    let emptyStateImageDark = "emptystate-dark"
    let productsPageTitle = "Products"
    let productsPageSubtitle = "Coming Soon"
    let productsPageDescription = "We are currently working in more features to offer the best experience"
    let productsHeaderImageHeight: CGFloat = 150.0
    let productsHeaderImageWidth: CGFloat = 400.0
    let productsMainImageFrame: CGFloat = 250.0
    // Apps Main Colors
    let lightMode = Color(hex: 0xF9F9F9)
    let darkMode = Color(hex: 0x1C1C1E)
}
