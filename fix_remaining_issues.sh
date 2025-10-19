#!/bin/bash

echo "🔧 Fixing remaining theme migration issues..."

# List of files with AppTextStyles issues
files_to_fix=(
    "lib/features/auth/view/widgets/sign_up_text.dart"
    "lib/features/events/view/pages/new_event_page.dart"
    "lib/features/home/view/pages/home_page.dart"
    "lib/features/home/view/widgets/event_card.dart"
    "lib/features/home/view/widgets/recommended_card.dart"
    "lib/features/onboarding/view/pages/getstarted_screen.dart"
    "lib/features/profile/view/pages/profile_page.dart"
    "lib/features/profile/view/widgets/edit_profile_page.dart"
    "lib/features/profile/view/widgets/email_field.dart"
    "lib/features/profile/view/widgets/name_field.dart"
    "lib/features/search/view/pages/search_page.dart"
    "lib/features/search/view/widgets/filter_page.dart"
    "lib/features/search/view/widgets/search_result_card.dart"
)

for file in "${files_to_fix[@]}"; do
    if [ -f "$file" ]; then
        echo "🔄 Fixing AppTextStyles in $file"
        
        # Replace common AppTextStyles patterns
        sed -i 's/AppTextStyles\.termStyle2/context.textTheme.bodyMedium/g' "$file"
        sed -i 's/AppTextStyles\.labelText/context.textTheme.labelMedium/g' "$file"
        sed -i 's/AppTextStyles\.bodyText1/context.textTheme.bodyLarge/g' "$file"
        sed -i 's/AppTextStyles\.bodyText2/context.textTheme.bodyMedium/g' "$file"
        sed -i 's/AppTextStyles\.bodyText3/context.textTheme.bodySmall/g' "$file"
        sed -i 's/AppTextStyles\.headline1/context.textTheme.headlineLarge/g' "$file"
        sed -i 's/AppTextStyles\.headline2/context.textTheme.headlineMedium/g' "$file"
        sed -i 's/AppTextStyles\.headline3/context.textTheme.headlineSmall/g' "$file"
        sed -i 's/AppTextStyles\.subtitle1/context.textTheme.titleMedium/g' "$file"
        sed -i 's/AppTextStyles\.subtitle2/context.textTheme.titleSmall/g' "$file"
        sed -i 's/AppTextStyles\.caption/context.textTheme.bodySmall/g' "$file"
        sed -i 's/AppTextStyles\.button/context.textTheme.labelLarge/g' "$file"
        
        # Fix labelLarge2 references (custom style that doesn't exist)
        sed -i 's/\.labelLarge2/.labelLarge/g' "$file"
        
        echo "✅ Fixed: $file"
    fi
done

# Fix const issues by removing const where Theme.of(context) is used
echo "🔧 Fixing const issues..."
files_with_const_issues=(
    "lib/features/auth/view/pages/signup_page.dart"
    "lib/features/auth/view/widgets/password_text_field.dart"
    "lib/features/auth/view/widgets/remember_me_and_forgot_password.dart"
    "lib/features/events/view/pages/events_page.dart"
    "lib/features/events/view/pages/new_event_page.dart"
    "lib/features/home/view/widgets/event_card.dart"
    "lib/features/onboarding/view/pages/getstarted_screen.dart"
    "lib/features/profile/view/widgets/edit_profile_page.dart"
    "lib/features/profile/view/widgets/email_field.dart"
    "lib/features/profile/view/widgets/name_field.dart"
    "lib/features/profile/view/widgets/settings_card.dart"
    "lib/features/search/view/widgets/search_result_card.dart"
)

for file in "${files_with_const_issues[@]}"; do
    if [ -f "$file" ]; then
        echo "🔄 Fixing const issues in $file"
        
        # Remove const before context.colors or context.textTheme usage
        sed -i 's/const \[\([^]]*context\.[^]]*\)\]/[\1]/g' "$file"
        sed -i 's/const \([^,]*context\.[^,]*\)/\1/g' "$file"
        
        echo "✅ Fixed const issues: $file"
    fi
done

# Fix bottom_nav.dart null safety issues
echo "🔧 Fixing bottom_nav.dart null safety issues..."
if [ -f "lib/shared/widgets/bottom_nav.dart" ]; then
    # Add null checks for copyWith calls
    sed -i 's/\.copyWith(/?\.copyWith(/g' "lib/shared/widgets/bottom_nav.dart"
    echo "✅ Fixed null safety issues in bottom_nav.dart"
fi

echo "🎉 All remaining issues have been fixed!"
echo "📋 Run 'flutter analyze' again to verify the fixes"