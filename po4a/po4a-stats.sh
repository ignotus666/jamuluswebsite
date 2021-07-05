#!/bin/bash

# Directory for stats file
STAT_DIR="../translator-files"

# Remove stats file before creating new one
rm -f "../translator-files/statistics.md"

# Create table header
echo "|Language| File | Status |" >> "$STAT_DIR"/statistics.md
echo "|--------|------|--------|" >> "$STAT_DIR"/statistics.md

produce_stats () {
# Determine file names
	while IFS= read -r -d '' file ; do
		basename="$(basename -s .md "$file")"

		# Stats printed to translator-files/statistics.md
		echo -n "|**"$lang"**| **"$basename".po**|" >> "$STAT_DIR"/statistics.md
		msgfmt --statistics "$PO_DIR/$lang/$basename".po &>> "$STAT_DIR"/statistics.md

	done <   <(find -L "$SRC_DIR" -name "*.md"  -print0)

	#separator between languages
	echo "|**-----**|**--------------------**|**--------------------**|" >> "$STAT_DIR"/statistics.md
}

# Run produce_stats on each language folder
while IFS= read -r -d '' dir ; do
	lang=$(basename -s .md "$dir")
	produce_stats "$lang"
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

# Remove unwanted messages.mo file created
rm -f *.mo

echo Statistics file created
