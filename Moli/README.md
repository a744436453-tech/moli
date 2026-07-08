# Moli iOS Project Structure

This directory follows a feature-oriented structure aligned with the PRD user journeys.

- `App/`: application lifecycle, scene setup, and configuration.
- `Core/`: reusable foundations that do not depend on business features.
- `Modules/`: feature modules grouped by product flows and tabs (e.g., onboarding, pet setup, home, interaction, chat, memory, profile).
- `Models/`: global domain models shared across modules.
- `Database/`: persistence managers and repositories.
- `Services/`: integrations with external or platform services (e.g., avatar generation, notifications, analytics).
- `Resources/`: asset catalogs, sounds, and Lottie animation files.
- `Supporting Files/`: bridging headers and other Xcode support files.
- `Moli.xcodeproj/`: Xcode project bundle placeholder.