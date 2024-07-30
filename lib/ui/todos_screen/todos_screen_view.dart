import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_todo_app/ui/todos_screen/todos_screen_viewmodel.dart';

class TodosScreenView extends StatelessWidget {
  const TodosScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodosScreenViewmodel>.reactive(
      viewModelBuilder: ()=> TodosScreenViewmodel(),
      builder:(context,model,_)=> Scaffold(
        appBar: AppBar(title: Text('Flutter Stacked Todos'),),
        body:ListView(
          children: [
            if(model.todos.isEmpty)
            Opacity(
              opacity: 0.5,
              child: Column(
                children: [
                  SizedBox(height: 64,),
                  Icon(Icons.emoji_food_beverage_outlined,size: 48,),
                  SizedBox(height: 16,),
                  Text('No todos yet.Click + to add a new one ')
                ],
              ),),
              ...model.todos.map((todo){
                return ListTile(
                  leading: IconButton(
                    icon: Icon(todo.completed?Icons.task_alt:Icons.circle_outlined),
                    onPressed: () => model.toggleStatus(todo.id),
                  ),
                        title: TextField(
                  controller: TextEditingController(text: todo.content),
                  decoration: null,
                  focusNode: model.getFocusNode(todo.id),
                  maxLines: null,
                  onChanged: (text) => model.updateTodoContent(todo.id, text),
                  style: TextStyle(
                    fontSize: 20,
                    decoration:
                        todo.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: IconButton(onPressed: ()=>model.removeTodo(todo.id), 
                icon: Icon(Icons.horizontal_rule)),
                );
              })
          ],
        ) ,
      )
    );
  }
}