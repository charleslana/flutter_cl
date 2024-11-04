import 'package:dio/dio.dart';
import 'package:flutter_cl/models/todo_model.dart';

class TodoRepository {
  TodoRepository([Dio? client]) {
    if (client == null) {
      dio = Dio();
      return;
    }
    dio = client;
  }

  late Dio dio;

  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    final Response<dynamic> response = await dio.get<dynamic>(url);
    if (response.statusCode == 200) {
      final list = response.data as List;
      final List<TodoModel> todos = [];
      for (final json in list) {
        final todo = TodoModel.fromJson(json);
        todos.add(todo);
      }
      return todos;
    }
    throw Exception('Failed to load todos');
  }
}
