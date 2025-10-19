#!/bin/bash

# Automated Theme Migration Script for Remaining Files
echo "🚀 Starting automated migration for remaining files..."

# Files to migrate
FILES=(
  "lib/shared/widgets/bottom_nav.dart"
  "lib/features/auth/view/pages/signup_page.dart"
  "lib/features/auth/view/widgets/password_text_field.dart"
  "lib/features/auth/view/widgets/remember_me_and_forgot_password.dart"
  "lib/features/auth/view/widgets/social_buttons.dart"
  "lib/features/auth/view/widgets/sign_up_text.dart"
  "lib/features/profile/view/pages/profile_page.dart"
  "lib/features/profile/view/widgets/email_field.dart"
  "lib/features/profile/view/widgets/settings_card.dart"
  "lib/features/profile/view/widgets/edit_profile_page.dart"
  "lib/features/profile/view/widgets/name_field.dart"
  "lib/features/home/view/pages/home_page.dart"
  "lib/features/home/view/widgets/recommended_card.dart"
  "lib/features/home/view/widgets/event_card.dart"
  "lib/features/home/view/widgets/search_bar.dart"
  "lib/features/home/view/widgets/home_filter_icons.dart"
  "lib/features/events/view/pages/new_event_page.dart"
  "lib/features/events/view/pages/events_page.dart"
  "lib/features/events/view/widgets/event_card.dart"
  "lib/features/search/view/pages/search_page.dart"
  "lib/features/search/view/widgets/filter_pop.dart"
  "lib/features/search/view/widgets/search_result_card.dart"
  "lib/features/search/view/widgets/custom_search_bar.dart"
  "lib/features/search/view/widgets/filter_page.dart"
  "lib/features/onboarding/view/pages/getstarted_screen.dart"
  "lib/features/onboarding/view/pages/onboarding_screen.dart"
)

# Function to update imports
update_imports() {
  local file="$1"
  echo "  📄 Updating imports in $file"
  
  # Remove old imports
  sed -i '/import.*core\/theme\/colors.dart/d' "$file"
  sed -i '/import.*core\/theme\/text_styles.dart/d' "$file"
  
  # Add new import if not present and file uses theme
  if grep -q "AppColors\|AppTextStyles" "$file" 2>/dev/null; then
    # Check if new import already exists
    if ! grep -q "import.*core/theme/app_theme.dart" "$file" 2>/dev/null; then
      # Add import after existing flutter imports
      sed -i '/import.*flutter\/material.dart/a import '\''package:enzomir\/core\/theme\/app_theme.dart'\'';' "$file"
    fi
  fi
}

# Function to replace color references
update_colors() {
  local file="$1"
  echo "  🎨 Updating colors in $file"
  
  # Common color replacements
  sed -i 's/AppColors\.primary/context.colors.primary/g' "$file"
  sed -i 's/AppColors\.background/context.colors.surface/g' "$file"
  sed -i 's/AppColors\.titleTextColor/context.colors.onSurface/g' "$file"
  sed -i 's/AppColors\.subtitleTextColor/context.colors.onSurfaceVariant/g' "$file"
  sed -i 's/AppColors\.whiteTextColor/context.colors.onPrimary/g' "$file"
  sed -i 's/AppColors\.whiteButtonTextColor/context.colors.onSurface/g' "$file"
  sed -i 's/AppColors\.hintTextColor/context.colors.onSurfaceVariant/g' "$file"
  sed -i 's/AppColors\.locationTextColor/context.colors.tertiary/g' "$file"
  sed -i 's/AppColors\.greyText/context.colors.outline/g' "$file"
  sed -i 's/AppColors\.pureWhite/context.colors.surface/g' "$file"
  sed -i 's/AppColors\.pureBlack/context.colors.onSurface/g' "$file"
  sed -i 's/AppColors\.pureGrey/context.colors.outline/g' "$file"
}

# Function to replace text style references  
update_text_styles() {
  local file="$1"
  echo "  📝 Updating text styles in $file"
  
  # Common text style replacements
  sed -i 's/AppTextStyles\.onboardingHeading/context.textStyles.displayLarge/g' "$file"
  sed -i 's/AppTextStyles\.loginHeading/context.textStyles.displayMedium/g' "$file"
  sed -i 's/AppTextStyles\.getStartedHeading/context.textStyles.displaySmall/g' "$file"
  sed -i 's/AppTextStyles\.appBarHeading/context.textStyles.displaySmall/g' "$file"
  sed -i 's/AppTextStyles\.exploreHeading/context.textStyles.headlineMedium/g' "$file"
  sed -i 's/AppTextStyles\.homeHeading/context.textStyles.titleLarge/g' "$file"
  sed -i 's/AppTextStyles\.eventCardTitle/context.textStyles.titleMedium/g' "$file"
  sed -i 's/AppTextStyles\.exploreCardTitle/context.textStyles.titleSmall/g' "$file"
  sed -i 's/AppTextStyles\.inputTextStyle/context.textStyles.bodyLarge/g' "$file"
  sed -i 's/AppTextStyles\.locationText/context.textStyles.bodyMedium/g' "$file"
  sed -i 's/AppTextStyles\.exploreCardOrganizer/context.textStyles.bodySmall/g' "$file"
  sed -i 's/AppTextStyles\.getstartedbtn/context.textStyles.labelLarge/g' "$file"
  sed -i 's/AppTextStyles\.editButtonText/context.textStyles.labelMedium/g' "$file"
  sed -i 's/AppTextStyles\.botNavTextStyle/context.textStyles.labelSmall/g' "$file"
  sed -i 's/AppTextStyles\.hintTextSearch/context.textStyles.bodyLarge/g' "$file"
  sed -i 's/AppTextStyles\.onboardingText/context.textStyles.titleLarge/g' "$file"
  sed -i 's/AppTextStyles\.onboardingButton/context.textStyles.labelLarge/g' "$file"
  sed -i 's/AppTextStyles\.profileName/context.textStyles.headlineLarge/g' "$file"
  sed -i 's/AppTextStyles\.loginSubHeading/context.textStyles.bodyLarge/g' "$file"
}

# Process each file
for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    echo "🔄 Processing: $file"
    update_imports "$file"
    update_colors "$file"  
    update_text_styles "$file"
    echo "✅ Completed: $file"
  else
    echo "⚠️ File not found: $file"
  fi
done

echo ""
echo "🎉 Automated migration completed!"
echo "📋 Next steps:"
echo "1. Run 'flutter analyze' to check for any issues"
echo "2. Manually review files for any missed references"
echo "3. Test the app in both light and dark modes"
echo "4. Update any remaining manual styling to use theme components"

echo ""
echo "⚠️ Note: Some complex styling may need manual review and adjustment"