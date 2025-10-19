#!/bin/bash

# Professional Theme Migration Script for Enzomir
# This script removes the old theme files and updates remaining references

echo "🎨 Starting Professional Theme Migration..."

# Step 1: Backup old theme files (optional)
echo "📋 Creating backup of old theme files..."
mkdir -p /tmp/enzomir_theme_backup
cp -r lib/core/theme/colors.dart /tmp/enzomir_theme_backup/ 2>/dev/null || true
cp -r lib/core/theme/text_styles.dart /tmp/enzomir_theme_backup/ 2>/dev/null || true

# Step 2: Remove old theme files
echo "🗑️ Removing old theme files..."
rm -f lib/core/theme/colors.dart
rm -f lib/core/theme/text_styles.dart

# Step 3: Find remaining references to old theme files
echo "🔍 Scanning for remaining old theme references..."

OLD_THEME_REFS=$(find lib -name "*.dart" -type f -exec grep -l "AppColors\|AppTextStyles" {} \; 2>/dev/null || true)

if [ -n "$OLD_THEME_REFS" ]; then
    echo "⚠️ Found files still using old theme system:"
    echo "$OLD_THEME_REFS"
    echo ""
    echo "📝 Manual migration needed for these files:"
    echo "$OLD_THEME_REFS" | while read -r file; do
        echo "  - $file"
    done
    echo ""
    echo "💡 Use the MIGRATION_GUIDE.md for reference on how to update these files."
else
    echo "✅ No remaining references to old theme system found!"
fi

# Step 4: Check for old import statements
echo "🔍 Checking for old import statements..."
OLD_IMPORTS=$(find lib -name "*.dart" -type f -exec grep -l "core/theme/colors.dart\|core/theme/text_styles.dart" {} \; 2>/dev/null || true)

if [ -n "$OLD_IMPORTS" ]; then
    echo "⚠️ Found files with old import statements:"
    echo "$OLD_IMPORTS"
else
    echo "✅ No old import statements found!"
fi

# Step 5: Summary
echo ""
echo "📊 Migration Summary:"
echo "✅ New theme system: lib/core/theme/app_theme.dart"
echo "✅ Migration guide: lib/core/theme/MIGRATION_GUIDE.md"
echo "✅ Main.dart updated with theme configuration"
echo "✅ Several components already migrated to new system"

if [ -n "$OLD_THEME_REFS" ] || [ -n "$OLD_IMPORTS" ]; then
    echo "⚠️ Manual migration still needed for some components"
    echo "📖 Please refer to MIGRATION_GUIDE.md for detailed instructions"
else
    echo "🎉 Migration completed successfully!"
fi

echo ""
echo "🧪 Next steps:"
echo "1. Test the app in both light and dark modes"
echo "2. Update remaining components to use new theme system"
echo "3. Run 'flutter analyze' to check for any issues"
echo "4. Test app functionality with new theme"

echo ""
echo "💾 Old theme files backed up to: /tmp/enzomir_theme_backup/"
echo "🎯 Theme migration script completed!"