#!/bin/bash
# You need gettext

# Remove stats file before creating new one
rm -f "translator-files/statistics.md"
echo "|"$lang" | file | status |"
echo "|--------|------|--------|"

produce_stats () {
# Determine file names
	while IFS= read -r -d '' file ; do
		basename="$(basename -s .md "$file")"

		# Stats printed to translator-files/statistics.txt
		echo "|**"$lang"/"$basename".po:**|" >> translator-files/statistics.md
		msgfmt --statistics "$PO_DIR/$lang/$basename".po &>> translator-files/statistics.md
		echo '' >> translator-files/statistics.md

	done <   <(find -L "$SRC_DIR" -name "*.md"  -print0)
	echo '' >> translator-files/statistics.md
}

# Run produce_stats on each language folder
while IFS= read -r -d '' dir ; do
	lang=$(basename -s .md "$dir")
	echo "## "$lang":" >> translator-files/statistics.md
	echo '' >> translator-files/statistics.md
	produce_stats "$lang"
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

rm -f *.mo

echo Statistics file created
