# Moli iOS Project Structure

This directory is organized around the PRD user journeys instead of technical screens alone.

- `App/`: application lifecycle, scene setup, and configuration.
- `Core/`: reusable foundations that do not depend on business features.
- `Modules/`: PRD feature modules such as onboarding, pet profile setup, companion home, touch interaction, pet chat, memory timeline, profile, and shared UI.
- `Models/`: global domain models shared across modules.
- `Database/`: persistence managers and repositories.
- `Services/`: integrations with platform or external services, including digital avatar generation, notifications, and analytics.
- `Resources/`: asset catalogs, sounds, and Lottie animation files.
- `Supporting Files/`: bridging headers and other Xcode support files.
- `Moli.xcodeproj/`: Xcode project bundle placeholder.
