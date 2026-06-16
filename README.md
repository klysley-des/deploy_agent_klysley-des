# Student Attendance Tracker

## Project Overview

A shell script that automates setting up a Student Attendance Tracker workspace. It will make the necessary directory structure, run a Python health check, update the configuration parameters and get rid of interruptions through signal traps.

---

## Project Structure

```text
attendance_tracker_school/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log
```

---

## Features

Automatically generates project folders.
Creates required files
Checks the Python environment.Validates Python environment.
Uses sed to update attendance thresholds
Responds to SIGINT (Ctrl+C) with the use of trap
If you exit from this application, then save any unfinished projects to the archives

---

## How to Run

Attach an executable to the script:

```bash
chmod +x setup_project.sh
```

Run the script:

```bash
./setup_project.sh
```

---

## Updating Thresholds

When prompted:

```text
Would you like to update attendance thresholds? (yes/no)
```

Enter:

```text
yes
```

Now assign values to:

- Warning threshold
- Failure threshold

---

## Triggering the Archive Feature

As the script is executing:

```text
Ctrl + C
```

The script will:

1. Make an archive of the present project.
2. The partially completed directory will be deleted.
3. Exit safely.

---

## Health Check

The script checks whether Python 3 is installed or not with:

```bash
python3 --version
```

---

## Repository

Repository Name:

```text
deploy_agent_klysley-des
``` 
