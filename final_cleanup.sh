#!/bin/bash

echo "🔧 Final cleanup for remaining theme issues..."

# Fix remaining const issues with context usage
echo "🔄 Fixing const issues..."
problematic_files=(
    "lib/features/auth/view/pages/signup_page.dart"
    "lib/features/auth/view/widgets/remember_me_and_forgot_password.dart" 
    "lib/features/events/view/pages/events_page.dart"
)

for file in "${problematic_files[@]}"; do
    if [ -f "$file" ]; then
        echo "🔄 Fixing const issues in $file"
        
        # Read the file and check for const lists with context usage
        if grep -q "const \[.*context\." "$file"; then
            # Remove const from lists containing context
            sed -i 's/const \[\([^]]*context\.[^]]*\)\]/[\1]/g' "$file"
            echo "✅ Fixed const list in $file"
        fi
        
        # Check for const widgets with context usage
        if grep -q "const .*context\." "$file"; then
            # Remove const from widgets with context usage
            sed -i 's/const \([^,;]*context\.[^,;]*\)/\1/g' "$file"
            echo "✅ Fixed const widget in $file"
        fi
    fi
done

# Fix filter_page.dart method issue
echo "🔄 Fixing filter_page.dart..."
file="lib/features/search/view/widgets/filter_page.dart"
if [ -f "$file" ]; then
    # Check if there's an undefined context issue
    if grep -q "Widget _buildTypeChip(BuildContext context," "$file"; then
        # Method signature was already modified, just need to fix the call
        sed -i 's/_buildTypeChip(type/_buildTypeChip(context, type/g' "$file"
    else
        # Add BuildContext parameter to method
        sed -i 's/Widget _buildTypeChip(/Widget _buildTypeChip(BuildContext context, /g' "$file"
        sed -i 's/_buildTypeChip(/_buildTypeChip(context, /g' "$file"
    fi
    echo "✅ Fixed filter_page.dart method"
fi

# Remove unused imports
echo "🔄 Removing unused imports..."
file="lib/features/search/view/pages/search_page.dart"
if [ -f "$file" ]; then
    # Check if the import is actually unused
    if ! grep -q "AppTheme\|context\.colors\|context\.textTheme" "$file"; then
        sed -i '/import.*app_theme\.dart/d' "$file"
        echo "✅ Removed unused import from search_page.dart"
    fi
fi

echo "🎉 Final cleanup completed!"
echo "📋 Run 'flutter analyze' to verify all issues are resolved"