import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required String title});

 @override
  Widget build(BuildContext context) {
    // Create a Scaffold widget to provide a default app bar and body
    return Column(
        children: [
          // Add a Container widget with a fixed height to create some space between the app bar and the "Task List" heading
          Container(
            height: 50,
          ),
          // Center the "Task List" heading both horizontally and vertically
          const Center(
            child: Text(
              'Monthly Crop Choices',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Use an Expanded widget to fill the available space below the "Task List" heading
          Expanded(
            // Use a ListView.builder widget to create a list of milestones
            child: ListView.builder(
              // Set the number of milestones to create
              itemCount: 12,
              // Create each milestone using the itemBuilder callback
              itemBuilder: (context, index) {
                return InkWell(
                  // Add code here to expand/collapse the list of tasks for this milestone
                  onTap: () {
                    // TODO: Add code to expand/collapse the list of tasks
                  },
                  // Use a ListTile widget to create a standard layout for a list item
                  child: ListTile(
                    // Use a CircleAvatar widget to display the milestone number
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    // Use a Text widget to display the milestone name
                    title: Text('Milestone ${index + 1}'),
                  ),
                );
              },
            ),
          ),
        ],
      );
  }
}