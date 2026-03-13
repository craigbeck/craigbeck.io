#!/usr/bin/env bash
#
# Converts resume.md to an ATS-friendly PDF via pandoc + typst.
# Strips Jekyll frontmatter and HTML markup, producing clean markdown
# that pandoc can render into a single-column, parseable PDF.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INPUT="$PROJECT_DIR/resume.md"
OUTPUT="$PROJECT_DIR/public/resume.pdf"

# Allow overriding output path
if [ "${1:-}" != "" ]; then
  OUTPUT="$1"
fi

# Check dependencies
for cmd in pandoc typst; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: '$cmd' is required but not installed." >&2
    echo "  brew install $cmd" >&2
    exit 1
  fi
done

# Create a temp file for the cleaned markdown
TMPFILE=$(mktemp /tmp/resume-clean.XXXXXX.md)
trap 'rm -f "$TMPFILE"' EXIT

# Process resume.md:
# 1. Strip Jekyll frontmatter (everything between --- delimiters at top)
# 2. Convert the HTML h-card header block to plain markdown
# 3. Strip remaining HTML tags
# 4. Clean up markdown link references (keep text, drop URLs for cleaner ATS parsing)
{
  # Skip frontmatter
  in_frontmatter=0
  frontmatter_done=0
  header_done=0

  while IFS= read -r line; do
    # Handle frontmatter
    if [ "$frontmatter_done" -eq 0 ]; then
      if [ "$in_frontmatter" -eq 0 ] && [[ "$line" == "---" ]]; then
        in_frontmatter=1
        continue
      elif [ "$in_frontmatter" -eq 1 ] && [[ "$line" == "---" ]]; then
        frontmatter_done=1
        continue
      elif [ "$in_frontmatter" -eq 1 ]; then
        continue
      fi
    fi

    # Skip the HTML header block (div.h-card through </div> closing and <hr/>)
    if [[ "$line" == *"<div class=\"h-card\">"* ]]; then
      header_done=0
      # Output our own clean header instead
      echo "# Craig Beck"
      echo ""
      echo "Seattle, Washington"
      echo ""
      echo "craig.beck@me.com | 206-390-4022"
      echo ""
      echo "linkedin.com/in/craig-beck-software-engineer/"
      echo ""
      echo "github.com/craigbeck"
      echo ""
      echo "craigbeck.io"
      echo ""
      continue
    fi

    if [ "$header_done" -eq 0 ] && [[ "$line" == *"</div>"* ]]; then
      # Count closing divs; the h-card block has nested divs
      # We'll skip until we hit the <hr/> line
      continue
    fi

    if [ "$header_done" -eq 0 ] && [[ "$line" == "<hr/>" ]]; then
      header_done=1
      echo "---"
      echo ""
      continue
    fi

    if [ "$header_done" -eq 0 ] && [[ "$line" == *"<"* ]]; then
      # Still in the HTML header block, skip
      continue
    fi

    if [ "$header_done" -eq 0 ] && [ -z "$line" ]; then
      continue
    fi

    # Strip any remaining inline HTML tags
    cleaned=$(echo "$line" | sed -E 's/<[^>]+>//g')

    # Convert markdown links [text](url) to just text for ATS clarity
    # But keep the text content
    cleaned=$(echo "$cleaned" | sed -E 's/\[([^]]+)\]\([^)]+\)/\1/g')

    echo "$cleaned"
  done < "$INPUT"
} > "$TMPFILE"

# Generate PDF using pandoc with typst backend and custom template
TEMPLATE="$SCRIPT_DIR/resume.typst"

pandoc "$TMPFILE" \
  -o "$OUTPUT" \
  --pdf-engine=typst \
  --template="$TEMPLATE" \
  --metadata title="" \
  2>&1

echo "Generated: $OUTPUT"
