#!/bin/zsh 

SOURCE_DIR="/Users/jamininia/work/github/sandbox/toolbox/file-organiser/downloads"
TARGET_DIR="/Users/jamininia/work/github/sandbox/toolbox/file-organiser/data"

for file in "$SOURCE_DIR"/*; do
    # SKip if not a file
    [ -f "$file" ] || continue

    filename=$(basename "$file")
    
    # Exrtract extension
    extension="${filename##*.}"
    extension=$(echo "$extension" | tr '[:upper]' '[:lower]')

    # Extract date (assuming format *YYYY-MM-DD*)
    date=$(echo "$filename" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}')

    if [ -z "$date" ]; then
        echo "Skipping $filename (no date found)"
        continue
    fi

    year=$(echo "$date" | cut -d- -f1)
    month=$(echo "$date" | cut -d- -f2)

    # Categorise by file type
    case  "$extension" in
        jpg|jpeg|png|gif|webp)
            category="images"
            ;;
        pdf|doc|docx|txt|md)
            category="documents"
            ;;
        mp4|mov|avi|mkv)
            category="videos"
            ;;
        mp3|wav|flac)
            category="audio"
            ;;
        *)
            category="other"
            ;;
    esac

    
    target_dir="$TARGET_DIR/$category/$year/$month"

    # Create dir if it doesn't exist
    mkdir -p "$target_dir"

    mv "$file" "$target_dir/"
    
    echo "Moved $filename -> $target_dir"
    
done
