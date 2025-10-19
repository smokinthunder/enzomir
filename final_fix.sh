#!/bin/bash

echo "🔧 Final comprehensive fix for all remaining issues..."

# Fix new_event_page.dart context issues
echo "🔄 Fixing new_event_page.dart context issues..."
file="lib/features/events/view/pages/new_event_page.dart"

if [ -f "$file" ]; then
    # Fix all context.textStyles to Theme.of(context).textTheme
    sed -i 's/context\.textStyles\./Theme.of(context).textTheme./g' "$file"
    
    # Fix specific style references that might still exist
    sed -i 's/AppTextStyles\.formLabelText/Theme.of(context).textTheme.labelMedium/g' "$file"
    sed -i 's/AppTextStyles\.formHintText/Theme.of(context).textTheme.bodyMedium/g' "$file"
    
    echo "✅ Fixed context issues in $file"
fi

# Fix filter_page.dart context issue
echo "🔄 Fixing filter_page.dart context issues..."
file="lib/features/search/view/widgets/filter_page.dart"
if [ -f "$file" ]; then
    # Fix any remaining context issues that might be in static/const contexts
    sed -i 's/context\.textStyles\./Theme.of(context).textTheme./g' "$file"
    echo "✅ Fixed context issues in $file"
fi

# Fix any remaining const issues more thoroughly
echo "🔧 Final const cleanup..."
files_for_const_cleanup=(
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

for file in "${files_for_const_cleanup[@]}"; do
    if [ -f "$file" ]; then
        echo "🔄 Final const cleanup in $file"
        
        # More aggressive const removal for theme-related expressions
        sed -i 's/const \([^}]*context\.colors[^}]*\)/\1/g' "$file"
        sed -i 's/const \([^}]*Theme\.of(context)[^}]*\)/\1/g' "$file"
        sed -i 's/const Text(/Text(/g' "$file"
        sed -i 's/const Icon(/Icon(/g' "$file"
        sed -i 's/const Container(/Container(/g' "$file"
        
        echo "✅ Final const cleanup: $file"
    fi
done

echo "🎉 Final comprehensive fix completed!"
echo "📋 Run 'flutter analyze' to verify all issues are resolved"