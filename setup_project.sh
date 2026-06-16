#!/bin/bash
echo "Attendance Tracker"
read -p "Enter the project name: " project_name
project_dir="attendance_tracker_${project_name}"
cleanup() {
echo "Script was interrupted."
tar -czf "attendance_tracker_${project_dir}_archive.tar.gz" "$project_dir"
rm -rf "$project_dir"
echo "Project archived successfully."
echo "Incomplete directory has been removed."
exit 1
}
trap cleanup INT
echo "Performing a Health Check..."
if python3 --version > /dev/null 2>&1
then
echo "Python3 is already installed."
else
echo "Warning: Python3 is not installed."
fi

mkdir -p "attendance_tracker_${project_name}"
mkdir -p "attendance_tracker_${project_name}/Helpers"
mkdir -p "attendance_tracker_${project_name}/reports"
touch "attendance_tracker_${project_name}/attendance_checker.py"
touch "attendance_tracker_${project_name}/Helpers/assets.csv"
touch "attendance_tracker_${project_name}/Helpers/config.json"
touch "attendance_tracker_${project_name}/reports/reports.log"
cat > "attendance_tracker_${project_name}/Helpers/config.json" << EOF
{
    "thresholds": {
        "warning": 75,
        "failure": 50
    },
    "run_mode": "live",
    "total_sessions": 15
}
EOF

read -p "Would you like to  update attendance thresholds? (yes/no): " choice
if [ "$choice" = "yes" ]
then
read -p "Enter warning threshold: " warning
read -p "Enter failure threshold: " failure

sed -i "s/\"warning\": 75/\"warning\": $warning/" \
	"attendance_tracker_${project_name}/Helpers/config.json"
sed -i "s/\"failure\": 50/\"failure\": $failure/" \
	"attendance_tracker_${project_name}/Helpers/config.json"
echo "Thresholds updated successfully!"
fi
