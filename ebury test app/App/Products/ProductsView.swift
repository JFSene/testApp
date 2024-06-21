import SwiftUI

struct ProductsView: View {
    // Access the current color scheme (light or dark mode)
    @Environment(\.colorScheme) var colorScheme
    // Access constants from the environment
    @Environment(\.strings) var constantsStore

    var body: some View {
        VStack {
            // Background image
            ZStack {
                // Choose the appropriate image based on the color scheme
                Image(
                    colorScheme == .light ?
                    constantsStore.lightModeImage :
                    constantsStore.darkModeImage
                )
                .resizable() // Make the image resizable
                .scaledToFill() // Scale the image to fit within its space
                .clipped() // Clip the image to its bounding box
                .ignoresSafeArea() // Extend the image to the edges of the safe area
                .frame(
                    width: constantsStore.productsHeaderImageWidth,
                    height: constantsStore.productsHeaderImageHeight
                )
                HStack {
                    VStack(
                        alignment: .leading,
                        spacing: constantsStore.mainVStackSpacing
                    ) {
                        // Title text with bold font and white color
                        Text(constantsStore.productsPageTitle)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(
                                .init(
                                    top: constantsStore.zeroValue,
                                    leading: constantsStore.leadingPadding,
                                    bottom: constantsStore.internalVStackBottonPadding,
                                    trailing: constantsStore.zeroValue
                                )
                            )
                    }
                    Spacer() // Add space between the VStack and the trailing edge
                }
            }

            VStack(
                alignment: .center,
                spacing: constantsStore.noNetworkVStackSpacing
            ) {
                // Subtitle text
                Text(constantsStore.productsPageSubtitle)
                    .font(.title)
                    .padding(.top, 100)
                
                // Image for the empty state, based on the color scheme
                Image(
                    colorScheme == .light ?
                    constantsStore.emptyStateImageLight :
                    constantsStore.emptyStateImageDark
                )
                .resizable() // Make the image resizable
                .scaledToFill() // Scale the image to fit within its space
                .clipped() // Clip the image to its bounding box
                .frame(
                    width: constantsStore.productsMainImageFrame,
                    height: constantsStore.productsMainImageFrame
                )
                
                // Description text with medium font weight and gray color
                Text(constantsStore.productsPageDescription)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                
                Spacer() // Add space to push content to the top
            }
            .frame(width: UIScreen.main.bounds.width)
            // Background color based on the current color scheme
            .background(
                colorScheme == .light ?
                constantsStore.lightMode : .black
            )
            // Rounded corners on the top left and top right
            .cornerRadius(
                constantsStore.listCornerRadius,
                corners: [.topLeft, .topRight]
            )
            // Shadow effect with a specified radius
            .shadow(radius: constantsStore.listShadowRadius)
            // Extend the view to ignore safe area at the bottom
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ProductsView()
}
