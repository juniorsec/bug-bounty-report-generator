#!/bin/bash
GREEN="\033[0;32m"
CYAN="\033[0;36m"
RED="\033[0;31m"
RESET="\033[0m"

echo -e "${CYAN}Bug Bounty Report Generator${RESET}"
echo "--------------------------------------"

read -p "Nama Target: " target
read -p "Jenis Kerentanan (e.g., SQL Injection, XSS, CSRF): " vulnerability
read -p "Langkah Eksploitasi (Pisahkan dengan ';'): " exploitation_steps
read -p "Dampak Kerentanan: " impact
read -p "Rekomendasi Perbaikan: " mitigation
read -p "Nama File Output (tanpa ekstensi): " filename

report_date=$(date +"%Y-%m-%d %H:%M:%S")

output_file="${filename}.txt"

echo "--------------------------------------" > $output_file
echo "Bug Bounty Report" >> $output_file
echo "Generated on: $report_date" >> $output_file
echo "--------------------------------------" >> $output_file
echo "" >> $output_file
echo "Target: $target" >> $output_file
echo "Vulnerability Type: $vulnerability" >> $output_file
echo "" >> $output_file
echo "Exploitation Steps:" >> $output_file

IFS=';' read -ra steps <<< "$exploitation_steps"
for step in "${steps[@]}"; do
    echo "- $step" >> $output_file
done

echo "" >> $output_file
echo "Impact:" >> $output_file
echo "$impact" >> $output_file
echo "" >> $output_file
echo "Mitigation Recommendation:" >> $output_file
echo "$mitigation" >> $output_file
echo "" >> $output_file
echo "--------------------------------------" >> $output_file
echo "End of Report" >> $output_file

echo -e "${GREEN}Laporan telah berhasil dibuat!${RESET}"
echo -e "File: ${CYAN}${output_file}${RESET}"
