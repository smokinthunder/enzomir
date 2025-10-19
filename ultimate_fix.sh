#!/bin/bash

echo "🔧 Ultimate fix for all theme migration issues..."

# Fix all AppTextStyles references across the codebase
echo "🔄 Fixing all AppTextStyles references..."
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.termStyle2/Theme.of(context).textTheme.bodyMedium/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.labelText/Theme.of(context).textTheme.labelMedium/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.bodyText1/Theme.of(context).textTheme.bodyLarge/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.bodyText2/Theme.of(context).textTheme.bodyMedium/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.bodyText3/Theme.of(context).textTheme.bodySmall/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.headline1/Theme.of(context).textTheme.headlineLarge/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.headline2/Theme.of(context).textTheme.headlineMedium/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.headline3/Theme.of(context).textTheme.headlineSmall/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.subtitle1/Theme.of(context).textTheme.titleMedium/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.subtitle2/Theme.of(context).textTheme.titleSmall/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.caption/Theme.of(context).textTheme.bodySmall/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.button/Theme.of(context).textTheme.labelLarge/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.formLabelText/Theme.of(context).textTheme.labelMedium/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.formHintText/Theme.of(context).textTheme.bodyMedium/g' {} \;

# Fix any remaining AppTextStyles references with a generic replacement
find lib -name "*.dart" -type f -exec sed -i 's/AppTextStyles\.[a-zA-Z0-9_]*/Theme.of(context).textTheme.bodyMedium/g' {} \;

# Fix context.textTheme to Theme.of(context).textTheme
echo "🔄 Fixing context.textTheme references..."
find lib -name "*.dart" -type f -exec sed -i 's/context\.textTheme/Theme.of(context).textTheme/g' {} \;

# Fix specific issues in new_event_page.dart - methods need BuildContext parameter
echo "🔄 Fixing new_event_page.dart method signatures..."
file="lib/features/events/view/pages/new_event_page.dart"
if [ -f "$file" ]; then
    # Fix methods to accept BuildContext
    sed -i 's/Widget _buildCoverPhotoUploader(/Widget _buildCoverPhotoUploader(BuildContext context,/' "$file"
    sed -i 's/Widget _buildInputField(/Widget _buildInputField(BuildContext context,/' "$file"
    sed -i 's/Widget _buildDropdownField(/Widget _buildDropdownField(BuildContext context,/' "$file"
    sed -i 's/Widget _buildTextAreaField(/Widget _buildTextAreaField(BuildContext context,/' "$file"
    sed -i 's/Widget _buildFieldLabel(/Widget _buildFieldLabel(BuildContext context,/' "$file"
    sed -i 's/Widget _buildSubmitButton(/Widget _buildSubmitButton(BuildContext context,/' "$file"
    
    # Fix method calls to pass context
    sed -i 's/_buildCoverPhotoUploader(context)/_buildCoverPhotoUploader(context, context)/g' "$file"
    sed -i 's/_buildInputField(/_buildInputField(context, /g' "$file"
    sed -i 's/_buildDropdownField(/_buildDropdownField(context, /g' "$file"
    sed -i 's/_buildTextAreaField(/_buildTextAreaField(context, /g' "$file"
    sed -i 's/_buildFieldLabel(/_buildFieldLabel(context, /g' "$file"
    sed -i 's/_buildSubmitButton(context)/_buildSubmitButton(context, context)/g' "$file"
    
    # Fix the duplicate context issue
    sed -i 's/_buildCoverPhotoUploader(context, context)/_buildCoverPhotoUploader(context)/g' "$file"
    sed -i 's/_buildSubmitButton(context, context)/_buildSubmitButton(context)/g' "$file"
fi

# Fix filter_page.dart method signature
echo "🔄 Fixing filter_page.dart method signature..."
file="lib/features/search/view/widgets/filter_page.dart"
if [ -f "$file" ]; then
    sed -i 's/Widget _buildTypeChip(/Widget _buildTypeChip(BuildContext context,/' "$file"
    sed -i 's/_buildTypeChip(/_buildTypeChip(context, /g' "$file"
fi

# Remove const from any remaining contexts
echo "🔄 Final const cleanup..."
find lib -name "*.dart" -type f -exec sed -i 's/const \[\([^]]*Theme\.of(context)[^]]*\)\]/[\1]/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/const \[\([^]]*context\.colors[^]]*\)\]/[\1]/g' {} \;
find lib -name "*.dart" -type f -exec sed -i 's/const Divider(/Divider(/g' {} \;

# Add null safety for copyWith calls
echo "🔄 Adding null safety for copyWith calls..."
find lib -name "*.dart" -type f -exec sed -i 's/Theme\.of(context)\.textTheme\.\([a-zA-Z]*\)\.copyWith/Theme.of(context).textTheme.\1?.copyWith/g' {} \;

echo "🎉 Ultimate fix completed!"
echo "📋 Run 'flutter analyze' to verify all issues are resolved"