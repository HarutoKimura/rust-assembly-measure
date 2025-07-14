#!/bin/bash

# Cleanup script for BINSEC validation artifacts
# These files are generated during the build process and can be regenerated when needed

echo "BINSEC Artifact Cleanup"
echo "======================="

# Count artifacts before cleanup
HARNESS_COUNT=$(find binsec-validation/harnesses -name "harness_*.c" 2>/dev/null | wc -l)
EXEC_COUNT=$(find binsec-validation/harnesses -name "test_*" -type f -executable 2>/dev/null | wc -l)
CONFIG_COUNT=$(find binsec-validation/configs -name "config_*.cfg" 2>/dev/null | wc -l)

if [ $HARNESS_COUNT -eq 0 ] && [ $EXEC_COUNT -eq 0 ] && [ $CONFIG_COUNT -eq 0 ]; then
    echo "No BINSEC artifacts found to clean."
    exit 0
fi

echo "Found artifacts:"
echo "  - $HARNESS_COUNT harness C files"
echo "  - $EXEC_COUNT test executables"
echo "  - $CONFIG_COUNT configuration files"

# Calculate space usage
if [ $EXEC_COUNT -gt 0 ]; then
    SPACE_USED=$(du -ch binsec-validation/harnesses/*/*/test_* 2>/dev/null | tail -1 | cut -f1)
    echo "  - Space used by executables: $SPACE_USED"
fi

echo ""
read -p "Do you want to remove these artifacts? [y/N] " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Cleaning up..."
    
    # Remove harness C files
    find binsec-validation/harnesses -name "harness_*.c" -delete 2>/dev/null
    
    # Remove test executables
    find binsec-validation/harnesses -name "test_*" -type f -executable -delete 2>/dev/null
    
    # Remove configuration files
    find binsec-validation/configs -name "config_*.cfg" -delete 2>/dev/null
    
    echo "Cleanup complete!"
    echo ""
    echo "Note: These files will be regenerated automatically when you run:"
    echo "  CARGO_BINSEC_VALIDATE=1 cargo build"
else
    echo "Cleanup cancelled."
fi