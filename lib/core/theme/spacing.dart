/// Professional spacing and sizing system for the app
class AppSpacing {
  AppSpacing._();

  // Base spacing unit (8dp)
  static const double base = 8.0;

  // Common spacing values
  static const double xs = base * 0.5; // 4
  static const double sm = base * 1.0; // 8
  static const double md = base * 2.0; // 16
  static const double lg = base * 3.0; // 24
  static const double xl = base * 4.0; // 32
  static const double xxl = base * 6.0; // 48
  static const double xxxl = base * 8.0; // 64

  // Semantic spacing
  static const double elementSpacing = sm; // 8
  static const double sectionSpacing = md; // 16
  static const double pageSpacing = lg; // 24
  static const double cardSpacing = md; // 16
  static const double listItemSpacing = sm; // 8

  // Component specific spacing
  static const double buttonPadding = md; // 16
  static const double inputPadding = md; // 16
  static const double cardPadding = md; // 16
  static const double screenPadding = lg; // 24

  // Border radius values
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 20.0;
  static const double radiusXxl = 24.0;

  // Common border radius
  static const double cardRadius = radiusMd; // 12
  static const double buttonRadius = radiusSm; // 8
  static const double inputRadius = radiusSm; // 8
  static const double dialogRadius = radiusLg; // 16

  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Component heights
  static const double buttonHeight = 48.0;
  static const double inputHeight = 48.0;
  static const double appBarHeight = 56.0;
  static const double tabBarHeight = 48.0;
  static const double bottomNavHeight = 80.0;

  // Elevation values
  static const double elevationNone = 0.0;
  static const double elevationXs = 1.0;
  static const double elevationSm = 2.0;
  static const double elevationMd = 4.0;
  static const double elevationLg = 8.0;
  static const double elevationXl = 16.0;
}
