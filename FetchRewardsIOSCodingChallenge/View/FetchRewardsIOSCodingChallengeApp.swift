
import SwiftUI

@main
struct FetchRewardsIOSCodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            MealsView().environmentObject(MealContentViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
