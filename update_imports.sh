#!/bin/bash

# Script to update import paths for feature-first architecture migration

# Define the project root
PROJECT_ROOT="/home/antesh/Desktop/enzomir"

# Function to update imports in a file
update_imports() {
    local file="$1"
    echo "Updating imports in: $file"
    
    # Update auth imports
    sed -i 's|package:enzomir/presentation/auth/|package:enzomir/features/auth/view/pages/|g' "$file"
    sed -i 's|package:enzomir/presentation/auth/widgets/|package:enzomir/features/auth/view/widgets/|g' "$file"
    
    # Update events imports
    sed -i 's|package:enzomir/presentation/pages/events/|package:enzomir/features/events/view/pages/|g' "$file"
    sed -i 's|package:enzomir/presentation/pages/events/widgets/|package:enzomir/features/events/view/widgets/|g' "$file"
    
    # Update home imports
    sed -i 's|package:enzomir/presentation/pages/home/|package:enzomir/features/home/view/pages/|g' "$file"
    sed -i 's|package:enzomir/presentation/pages/home/widgets/|package:enzomir/features/home/view/widgets/|g' "$file"
    
    # Update search imports
    sed -i 's|package:enzomir/presentation/pages/search/|package:enzomir/features/search/view/pages/|g' "$file"
    
    # Update profile imports
    sed -i 's|package:enzomir/presentation/pages/profile/|package:enzomir/features/profile/view/pages/|g' "$file"
    sed -i 's|package:enzomir/presentation/pages/profile/widgets/|package:enzomir/features/profile/view/widgets/|g' "$file"
    
    # Update new_event imports (assuming it goes to events feature)
    sed -i 's|package:enzomir/presentation/pages/new_event/|package:enzomir/features/events/view/pages/|g' "$file"
    
    # Update onboarding imports
    sed -i 's|package:enzomir/presentation/pre_auth/|package:enzomir/features/onboarding/view/pages/|g' "$file"
    
    # Update core imports
    sed -i 's|package:enzomir/presentation/core/|package:enzomir/core/theme/|g' "$file"
    
    # Update shared imports
    sed -i 's|package:enzomir/presentation/root/|package:enzomir/shared/navigation/|g' "$file"
    sed -i 's|package:enzomir/presentation/widgets/|package:enzomir/shared/widgets/|g' "$file"
}

# Find all Dart files in the features directory and update their imports
find "$PROJECT_ROOT/lib/features" -name "*.dart" -type f | while read -r file; do
    update_imports "$file"
done

# Find all Dart files in the shared directory and update their imports
find "$PROJECT_ROOT/lib/shared" -name "*.dart" -type f | while read -r file; do
    update_imports "$file"
done

# Update main.dart and other root files if needed
if [ -f "$PROJECT_ROOT/lib/main.dart" ]; then
    update_imports "$PROJECT_ROOT/lib/main.dart"
fi

echo "Import path update completed!"