To-Do List App
This is a simple To-Do List application built using Swift, UIKit, and Core Data. The app allows users to add, edit, delete, and manage tasks. Tasks can be categorized into pending and completed sections, and all data is stored persistently using Core Data.

Features
- Task Management: Add, edit, and delete tasks with ease.
- Categorization: Tasks are categorized into two sections: Pending and Completed.
- Persistent Storage: All tasks are saved locally using Core Data.
- Task Details: View detailed information for each task.
- Swipe Gestures: Easily delete tasks by swiping.
- User-Friendly Interface: Simple and intuitive design.


Installation
- git clone https://github.com/mohdshorab/todolistiosnative.git
Open the project in Xcode:
- open ToDoListApp.xcodeproj
- Build and run the app on the iOS simulator or a connected device.
Usage


Adding a Task:

- Tap the + button on the main screen.
- Enter the task title and description.
- Tap Save to add the task to the list.

Editing a Task:

- Tap on a task in the list to view its details.
- Update the title or description as needed.
- Tap Save to update the task.

Deleting a Task: 

- Swipe left on a task in the list.(Pending)
- Tap the Delete button or confirm the deletion.

Categorizing Tasks:

- Tasks are automatically categorized into Pending or Completed based on their completion status.(Pending)
- Tapping the checkbox next to a task will toggle its completion status.(Pending)

Known Issues
- Duplicate Tasks: There may be an issue where creating a new task results in duplicate entries being displayed in the task list.
