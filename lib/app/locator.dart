import 'package:get_it/get_it.dart';
import 'package:stacked_todo_app/services/todo.services.dart';

final locator = GetIt.instance;
setUpLocator(){
  locator.registerLazySingleton(()=>TodosService());
}

// it locates services