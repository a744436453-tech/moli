# Feature Modules

The module names follow the PRD user journeys and product vocabulary:

| PRD journey | Module | Purpose |
| --- | --- | --- |
| 启动/进入应用 | `Onboarding` | Splash and first-entry routing. |
| 创建宠物档案 | `PetProfileSetup` | Life status, photo import, and pet profile form. |
| 数字形象生成 | `PetProfileSetup` + `ImageGenerationService` | Generates the pet avatar after profile setup. |
| 首页陪伴 | `CompanionHome` | Main companion screen, pet avatar, speech bubble, feeding, and play actions. |
| 互动玩法 | `TouchInteraction` | Touch-region detection, tactile feedback, and affection particles. |
| 聊天互动 | `PetChat` | Pet conversation UI, messages, and response orchestration. |
| 回忆时间线 | `MemoryTimeline` | Pet info card, timeline cells, and adding memory entries. |
| 我的/设置 | `Profile` | User settings, help, and account-related screens. |
| 通用组件 | `CommonUI` | Shared UI building blocks. |

Naming conventions:

- Prefix feature-specific classes with the product domain, such as `Pet`, `Companion`, `Touch`, or `MemoryTimeline`.
- Use concrete PRD terms instead of generic names: `PetPhotoImportView`, `PetSpeechBubbleView`, and `AffectionParticleView`.
- Keep cross-feature data in `Moli/Models` and feature-only presentation state inside each module.
