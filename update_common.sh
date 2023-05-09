#!/usr/bin/env bash

if [ "$(git diff | wc -l)" != "0" ]; then
  echo "commit your change before updating common files" >&2
  exit 1
fi

for template in *; do
  if [ -f "$template" ]; then continue; fi

  echo "updating $template template..."

  pushd "$template"

  while IFS= read -r -d '' file; do
    copied_file="${file#../.common/}"

		# If file already exist
		if [ -f "$copied_file" ]; then
		# And is different that current common file
		# we ignore it.
			diff "$file" "$copied_file" || continue
		fi

    mkdir -p $(dirname "$copied_file")
    ln -f "$file" "$copied_file"
  done < <(find "../.common" -type f -print0)

  popd

  echo "$template template updated."
done
