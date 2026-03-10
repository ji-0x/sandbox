# File Organiser (Sandbox Tool)

A simple **Zsh-based file organisation utility** that categorises files by **type and date** based on their filename.

This tool is designed as a small sandbox project to experiment with **shell scripting, file parsing, and directory automation**.

---

# Overview

The project contains two scripts:

1. **Test Data Generator** – creates a messy downloads-style directory with different file types and date patterns.
2. **File Organiser** – scans files, extracts dates from filenames, categorises them by type, and moves them into a structured folder hierarchy.

---

# Project Structure

```
file-organiser/
│
├── downloads/        # Raw files (simulates a messy downloads folder)
├── data/             # Organised output directory
│
├── generate-test-files.sh
├── organise-files.sh
└── README.md
```

---

# 1. Generate Test Files

The test script creates sample files with different:

* file types
* date formats
* naming patterns
* messy edge cases

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

Run the script:

```bash
./generate-test-files.sh
```

This will populate the `downloads/` directory with dummy files.

---

# 2. Organise Files

The organiser script:

1. Scans files in the **source directory**
2. Extracts a date from the filename (`YYYY-MM-DD`)
3. Determines the **file category** based on extension
4. Creates a directory structure
5. Moves the file into the correct location

Run:

```bash
./organise-files.sh
```

---

# Folder Structure Created

Files are organised into the following structure:

```
data/
  documents/
    2026/
      01/
      02/
  images/
  videos/
  audio/
  other/
```

Example result:

```
data/documents/2026/01/logs_2026-01-31.txt
data/other/2026/03/analytics-report-2026-03-01.csv
```

---

# File Type Categories

| Extension                 | Category  |
| ------------------------- | --------- |
| jpg, jpeg, png, gif, webp | images    |
| pdf, doc, docx, txt, md   | documents |
| mp4, mov, avi, mkv        | videos    |
| mp3, wav, flac            | audio     |
| everything else           | other     |

---

# Date Detection

The script extracts dates using this pattern:

```
YYYY-MM-DD
```

Example filenames that work:

```
sales_2026-01-01.csv
analytics-report-2026-03-01.csv
system_export_2026-03-05.json
```

Files **without a date** are skipped.

Example:

```
sales_final.csv
random_file
```

---

# Example Output

```
Moved sales_2026-01-01.csv -> data/other/2026/01
Moved logs_2026-02-01.txt -> data/documents/2026/02
Skipping random_file (no date found)
```

---

# Purpose

This sandbox tool demonstrates:

* Shell scripting with **Zsh**
* Filename parsing
* Regex date extraction
* File categorisation
* Dynamic directory creation
* Automation for file organisation

---

# Future Improvements

Possible enhancements:

* Add **dry-run mode**
* Support **more date formats**
* Add **logging**
* Detect **duplicate files**
* Add **CLI arguments for source/target directories**
* Parallel processing for large directories

---

# License

Sandbox / experimental project.
Use freely for learning or experimentation.
