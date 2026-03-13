# File Organiser (Sandbox Tool)

Simple Zsh utility that organises files into structured folders by detecting file type and date patterns from filenames.

---

## Overview

This project provides a small sandbox utility for experimenting with shell scripting and file automation.

The tool scans a directory containing messy files (similar to a downloads folder) and organises them into structured folders based on file type and date extracted from filenames.

The project includes two scripts:

* **Test Data Generator** – creates sample files with different file types and naming patterns
* **File Organiser** – scans files, extracts dates, and moves them into an organised directory structure

This project is intended for:

* learning shell scripting
* experimenting with file parsing
* testing directory automation workflows

---

## Requirements

System requirements:

* Linux / macOS
* Zsh

Standard utilities:

* `grep`
* `mkdir`
* `mv`
* `date`
* `awk`

---

## Installation

Clone the repository:

```bash
git clone git@github.com:ji-0x/sandbox.git
cd toolbox/file-organiser
```

Make scripts executable:

```bash
chmod +x generate-test-files.sh
chmod +x organise-files.sh
```

---

## Configuration

The scripts use two main directories:

```
downloads/   # source directory (messy files)
data/        # organised output directory
```

You can modify these paths inside the organiser script if needed.

Example categories used by the organiser:

```
images
documents
videos
audio
other
```

---

## Usage

### 1. Generate Test Files

Create sample files that simulate a messy downloads folder.

```bash
./generate-test-files.sh
```

Example files created:

```
sales_2026-01-01.csv
users_2025-04-01.json
logs_2026-02-01.txt
analytics-report-2026-03-01.csv
system_export_2026-03-05.json
sales_final.csv
random_file
```

---

### 2. Organise Files

Run the organiser script to sort files.

```bash
./organise-files.sh
```

The script will:

1. Scan files in the source directory
2. Extract a date from the filename (`YYYY-MM-DD`)
3. Determine the file category based on extension
4. Create the required directory structure
5. Move files into the correct location

---

## Example Output

```
Moved sales_2026-01-01.csv -> data/other/2026/01
Moved logs_2026-02-01.txt -> data/documents/2026/02
Skipping random_file (no date found)
```

---

## Automation Example

Example cron job:

```bash
*/5 * * * * /path/to/organise-files.sh
```

Runs the organiser script every 5 minutes to automatically sort new files.

---

## Project Structure

```
file-organiser/
├── downloads/
├── data/
├── generate-test-files.sh
├── organise-files.sh
└── README.md
```

---

## File Type Categories

| Extension | Category |
|----------|---------|
| jpg, jpeg, png, gif, webp | images |
| pdf, doc, docx, txt, md | documents |
| mp4, mov, avi, mkv | videos |
| mp3, wav, flac | audio |
| everything else | other |

---

## Date Detection

The script extracts dates using the following pattern:

```
YYYY-MM-DD
```

Example filenames that work:

```
sales_2026-01-01.csv
analytics-report-2026-03-01.csv
system_export_2026-03-05.json
```

Files **without a valid date** are skipped.

Example:

```
sales_final.csv
random_file
```

---

## Troubleshooting

Problem:  
Files are not being moved.

Solution:

* Ensure filenames contain a valid `YYYY-MM-DD` date pattern.
* Check that the `downloads/` directory contains files.
* Verify the scripts have executable permissions.

Example:

```bash
chmod +x organise-files.sh
```

---

## Future Improvements

Possible enhancements:

* Add **dry-run mode**
* Support **additional date formats**
* Add **logging**
* Detect **duplicate files**
* Add **CLI arguments for source and destination directories**
* Parallel processing for large directories