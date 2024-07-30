import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_todo_app/app/locator.dart';
import 'package:stacked_todo_app/models/todo.dart';
import 'package:stacked_todo_app/services/todo.services.dart';

class TodosScreenViewmodel extends ReactiveViewModel{
  final _firstTodoFocusNode= FocusNode();
  final _todoService = locator<TodosService>;
  late final toggleStatus = _todoService.toggleStatus;
  late final removeTodo=_todoService.removeTodo;
  late final updateTodoContent=_todoService.updateTodoContent;

  List<Todo> get todos=> _todoService.todos;

  void newTodo(){
    _todoService.newTodo();
    _firstTodoFocusNode.requestFocus();
  }

  FocusNode? getFocusNode(String id){
    final index = todos.indexWhere((todo)=>todo.id==id);
    return index==0 ? _firstTodoFocusNode:null;
  }
  
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_todoService];
}