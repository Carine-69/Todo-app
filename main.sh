#!/bin/bash

# File to store student records
STUDENTS_FILE="students-list_1023.txt"

# Function to create a student record
create_student() {
    echo "Enter student details:"
    read -p "Email: " email
    read -p "Age: " age
    read -p "Student ID: " student_id

    # Check if student ID already exists
    if grep -q "^$student_id:" "$STUDENTS_FILE"; then
        echo "Student with ID $student_id already exists."
    else
        echo "$email:$age:$student_id" >> "$STUDENTS_FILE"
        echo "Student record created successfully."
    fi
}

# Function to view all students
view_students() {
    if [ -s "$STUDENTS_FILE" ]; then
        echo "List of students:"
        cat "$STUDENTS_FILE"
    else
        echo "No students found."
    fi
}

# Function to delete a student by ID
delete_student() {
    read -p "Enter student ID to delete: " delete_id
    sed -i "/^$delete_id:/d" "$STUDENTS_FILE"
    echo "Student with ID $delete_id deleted successfully."
}

# Function to update a student record by ID
update_student() {
    read -p "Enter student ID to update: " update_id
    if grep -q "^$update_id:" "$STUDENTS_FILE"; then
        sed -i "/^$update_id:/d" "$STUDENTS_FILE"
        create_student
    else
        echo "Student with ID $update_id not found."
    fi
}

# Main menu
while true; do
    echo -e "\nMenu:"
    echo "1. Create Student Record"
    echo "2. View All Students"
    echo "3. Delete Student"
    echo "4. Update Student Record"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) Create_student;;
        2) view_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
