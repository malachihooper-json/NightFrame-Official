STREAMING_CHUNK: Configuring error handling and target paths

Exit immediately if a command exits with a non-zero status

set -e

The exact absolute path to your whitepaper

TARGET_FILE="/Users/malachihooper/Documents/technical developments/NightFrame-main/docs/WHITEPAPER.md"

Dynamically generate the output path by replacing .md with .pdf

OUTPUT_FILE="${TARGET_FILE%.md}.pdf"

echo "=== NIGHTFRAME Whitepaper Build Workflow ==="

STREAMING_CHUNK: Validating required dependencies

echo "[1/3] Checking prerequisites..."
if ! command -v pandoc &> /dev/null; then
echo "❌ Error: Pandoc is not installed."
echo "👉 Fix: Run 'brew install pandoc' in your terminal."
exit 1
fi

if ! command -v typst &> /dev/null; then
echo "❌ Error: Typst is not installed."
echo "👉 Fix: Run 'brew install typst' in your terminal."
exit 1
fi

STREAMING_CHUNK: Verifying target file existence

echo "[2/3] Locating source file..."
if [ ! -f "$TARGET_FILE" ]; then
echo "❌ Error: Cannot find $TARGET_FILE"
echo "Please check the path and try again."
exit 1
fi

STREAMING_CHUNK: Executing the compilation step

echo "[3/3] Compiling PDF via Typst engine..."

The quotes around the variables are critical here because of the space in "technical developments"

pandoc "$TARGET_FILE" 

--from markdown+tex_math_dollars+yaml_metadata_block 

--pdf-engine=typst 

--standalone 

-o "$OUTPUT_FILE"

echo "✅ Success! PDF generated at:"
echo "   $OUTPUT_FILE"