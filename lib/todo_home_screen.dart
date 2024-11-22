import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist_clone_app/constants.dart';
import 'package:todoist_clone_app/extension.dart';
import 'package:todoist_clone_app/service/todo_modal.dart';
import 'package:todoist_clone_app/widgets/bottom_nav_bar_widget.dart';
import 'package:todoist_clone_app/widgets/todo_tile_widget.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: ColorPallete.black,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.more_horiz_outlined,
              color: ColorPallete.red,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Today',
              style: TextStyle(
                color: ColorPallete.white,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '11 Aug - Sunday',
              style: TextStyle(
                color: ColorPallete.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            thickness: 0.1,
            color: ColorPallete.grey,
          ),
          Expanded(
            child: Consumer<TodoModel>(
              builder: (context, model, _) {
                final todos = model.todos;
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TodoTileWidget(
                          key: ValueKey(todos[index].id),
                          todo: todos[index],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const Divider(
                          thickness: 0.1,
                          color: ColorPallete.grey,
                          indent: 40.0,
                        )
                      ],
                    );
                  },
                  itemCount: todos.length,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPallete.red,
        onPressed: () {
          context.showAddTaskModalDialog();
        },
        tooltip: 'Add Task',
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: ColorPallete.white,
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
