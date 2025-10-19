# Feature-First Architecture Migration Script

This document outlines the migration from layer-based to feature-based architecture.

## Migration Plan

### 1. Auth Feature
**From:** `lib/presentation/auth/`
**To:** `lib/features/auth/view/`

Files to move:
- `login_page.dart` → `lib/features/auth/view/pages/login_page.dart`
- `signup_page.dart` → `lib/features/auth/view/pages/signup_page.dart`
- `widgets/` → `lib/features/auth/view/widgets/`

### 2. Events Feature
**From:** `lib/presentation/pages/events/`
**To:** `lib/features/events/view/`

Files to move:
- `events_page.dart` → `lib/features/events/view/pages/events_page.dart`
- `widgets/` → `lib/features/events/view/widgets/`

### 3. Home Feature
**From:** `lib/presentation/pages/home/`
**To:** `lib/features/home/view/`

Files to move:
- `home_page.dart` → `lib/features/home/view/pages/home_page.dart`
- `widgets/` → `lib/features/home/view/widgets/`

### 4. Search Feature
**From:** `lib/presentation/pages/search/`
**To:** `lib/features/search/view/`

Files to move:
- `search_page.dart` → `lib/features/search/view/pages/search_page.dart`

### 5. Profile Feature
**From:** `lib/presentation/pages/profile/`
**To:** `lib/features/profile/view/`

### 6. Onboarding Feature
**From:** `lib/presentation/pre_auth/`
**To:** `lib/features/onboarding/view/`

Files to move:
- `onboarding_screen.dart` → `lib/features/onboarding/view/pages/onboarding_screen.dart`
- `getstarted_screen.dart` → `lib/features/onboarding/view/pages/getstarted_screen.dart`

### 7. Shared Components
**From:** `lib/presentation/widgets/` & `lib/presentation/root/`
**To:** `lib/shared/`

Files to move:
- `bottom_nav.dart` → `lib/shared/widgets/bottom_nav.dart`
- `router.dart` → `lib/shared/navigation/router.dart`
- `layout_scaffold.dart` → `lib/shared/navigation/layout_scaffold.dart`

### 8. Core Theme
**From:** `lib/presentation/core/`
**To:** `lib/core/theme/`

Already moved:
- ✅ `colors.dart` → `lib/core/theme/colors.dart`
- ✅ `text_styles.dart` → `lib/core/theme/text_styles.dart`

## Import Path Updates

All imports need to be updated to reflect the new structure:

### Old imports:
```dart
import 'package:enzomir/presentation/auth/widgets/welcome_text.dart';
import 'package:enzomir/presentation/core/colors.dart';
import 'package:enzomir/presentation/pages/home/home_page.dart';
```

### New imports:
```dart
import 'package:enzomir/features/auth/view/widgets/welcome_text.dart';
import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/features/home/view/pages/home_page.dart';
```

## Final Directory Structure

```
lib/
├── core/
│   ├── constants/
│   ├── failure/
│   ├── models/
│   ├── providers/
│   ├── theme/
│   │   ├── colors.dart
│   │   └── text_styles.dart
│   └── utils/
├── features/
│   ├── auth/
│   │   ├── models/
│   │   ├── repositories/
│   │   ├── viewmodel/
│   │   └── view/
│   │       ├── pages/
│   │       │   ├── login_page.dart
│   │       │   └── signup_page.dart
│   │       └── widgets/
│   ├── events/
│   │   ├── models/
│   │   ├── repositories/
│   │   ├── viewmodel/
│   │   └── view/
│   │       ├── pages/
│   │       │   └── events_page.dart
│   │       └── widgets/
│   ├── home/
│   │   └── view/
│   │       ├── pages/
│   │       │   └── home_page.dart
│   │       └── widgets/
│   ├── search/
│   │   └── view/
│   │       └── pages/
│   │           └── search_page.dart
│   ├── profile/
│   │   └── view/
│   │       └── pages/
│   └── onboarding/
│       └── view/
│           └── pages/
│               ├── onboarding_screen.dart
│               └── getstarted_screen.dart
├── shared/
│   ├── widgets/
│   │   └── bottom_nav.dart
│   └── navigation/
│       ├── router.dart
│       └── layout_scaffold.dart
└── main.dart
```