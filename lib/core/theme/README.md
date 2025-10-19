# Professional Theme System

This directory contains a modular, professional theme system following industry best practices and Material 3 design guidelines.

## Architecture

The theme system is split into separate, focused files for better maintainability:

### 📁 File Structure

```
lib/core/theme/
├── theme.dart              # Central export file (import this in your components)
├── app_theme.dart          # Main theme composition
├── colors.dart             # Color system & schemes
├── typography.dart         # Text styles & font system
├── spacing.dart            # Spacing, sizing & layout constants
├── component_themes.dart   # Component-specific themes
├── theme_extensions.dart   # Helper extensions for easy access
└── README.md              # This documentation
```

### 🎨 Components

#### 1. **colors.dart**
- Professional color palette with Material 3 color schemes
- Separate light and dark theme configurations
- Brand colors, neutrals, and semantic colors
- Easy-to-use getter methods for ColorScheme

#### 2. **typography.dart** 
- Professional typography scale using Poppins and Inter fonts
- Complete Material 3 text theme coverage
- Consistent font weights and letter spacing
- Separate light/dark text themes

#### 3. **spacing.dart**
- 8dp grid-based spacing system
- Semantic spacing values (xs, sm, md, lg, xl, etc.)
- Component-specific dimensions (button height, padding, etc.)
- Border radius values and elevation scales

#### 4. **component_themes.dart**
- Styled themes for all major components:
  - Buttons (Elevated, Text, Outlined)
  - Input fields with proper decoration
  - Cards, Dialogs, AppBar
  - Bottom Navigation, List Tiles
  - Icons and Dividers

#### 5. **theme_extensions.dart**
- Convenient extension methods on BuildContext
- Easy access: `context.colors`, `context.textStyles`
- Theme-aware color and text style getters
- Dark mode detection utility

#### 6. **app_theme.dart**
- Composes all theme modules into cohesive ThemeData
- Provides `AppTheme.lightTheme` and `AppTheme.darkTheme`
- Used in MaterialApp theme configuration

#### 7. **theme.dart**
- Central export file for the entire theme system
- Single import point: `import 'package:enzomir/core/theme/theme.dart';`

## 🚀 Usage

### Basic Usage
```dart
// In your component files:
import 'package:enzomir/core/theme/theme.dart';

// Access theme properties:
Color primaryColor = context.colors.primary;
TextStyle headlineStyle = context.textStyles.headlineLarge;
bool isDark = context.isDarkMode;
```

### In MaterialApp
```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system,
  // ...
)
```

### Custom Components
```dart
Container(
  padding: EdgeInsets.all(AppSpacing.md),
  decoration: BoxDecoration(
    color: context.colors.surface,
    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
  ),
  child: Text(
    'Hello World',
    style: context.textStyles.headlineMedium,
  ),
)
```

## ✨ Benefits

1. **Modularity**: Each aspect of the theme is in its own file
2. **Maintainability**: Easy to update colors, typography, or spacing
3. **Consistency**: Centralized design tokens ensure consistency
4. **Developer Experience**: Easy-to-use extensions and clear API
5. **Professional**: Follows Material 3 and industry best practices
6. **Scalability**: Easy to extend with new components or themes

## 🎯 Best Practices

1. **Use semantic values**: Prefer `AppSpacing.cardRadius` over hardcoded values
2. **Access via extensions**: Use `context.colors.primary` instead of `Theme.of(context)`
3. **Maintain consistency**: Always use theme values instead of hardcoded colors/sizes
4. **Test both themes**: Ensure components work in both light and dark modes
5. **Follow the grid**: Use the 8dp spacing system for layouts

This theme system provides a solid foundation for building beautiful, consistent, and maintainable Flutter applications.
