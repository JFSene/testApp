import SwiftUI

struct HeaderView: View {
    // Access the current color scheme (light or dark mode)
    @Environment(\.colorScheme) var colorScheme
    // Access constants from the environment
    @Environment(\.strings) var constantsStore
    
    var body: some View {
        ZStack {
            // Choose the appropriate image based on the color scheme
            Image(
                colorScheme == .light ?
                constantsStore.lightModeImage :
                constantsStore.darkModeImage
            )
            .resizable() // Make the image resizable
            .scaledToFit() // Scale the image to fit within its space
            .clipped() // Clip the image to its bounding box
            .ignoresSafeArea() // Extend the image to the edges of the safe area
            HStack {
                VStack(
                    alignment: .leading,
                    spacing: constantsStore.mainVStackSpacing
                ) {
                    Image(constantsStore.accountIcon)
                        .resizable()
                        .frame(
                            width: constantsStore.iconWidthHeight,
                            height: constantsStore.iconWidthHeight
                        )
                        .foregroundColor(.white)
                        .padding(
                            .init(
                                top: constantsStore.iconPaddingTop,
                                leading: constantsStore.leadingPadding,
                                bottom: constantsStore.zeroValue,
                                trailing: constantsStore.zeroValue
                            )
                        )
                    VStack(
                        alignment: .leading,
                        spacing: constantsStore.internalVStackSpacing
                    ) {
                        Text(constantsStore.welcome)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        Text(constantsStore.companyName)
                            .fontWeight(.semibold)
                            .font(.title3)
                            .foregroundColor(.white)
                    }
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
            .padding(
                .init(
                    top: constantsStore.zeroValue,
                    leading: constantsStore.zeroValue,
                    bottom: constantsStore.mainVStackBottonPadding,
                    trailing: constantsStore.zeroValue
                )
            )
        }
    }
}

#Preview {
    HeaderView()
}
