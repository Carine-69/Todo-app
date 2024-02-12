#!/bin/bash
#File to read student recors from
STUDENT_FILE="student_list_1023.txt"
#Output file for emails
EMAILS_FILE="student_emails.txt"
#Extract emails and save to output file
cut -d':' -f1 "$STUDENT_FILE" > "$EMAILS_FILE"
echo "Emails extracted and saved to $EMAILS_FILE."
