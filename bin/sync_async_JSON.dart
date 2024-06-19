import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final todo = await fetch();
  print(todo.title);
}

Future<Todo> fetch() async {
  var response = await http.get(Uri.https('jsonplaceholder.typicode.com','/todos/1'));
  return Todo.fromJson(jsonDecode(response.body));
}

class Todo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo({required this.title, required this.id, required this.userId, required this.completed});

  factory Todo.fromJson(Map json) {
    return Todo(title: json['title'], id: json['id'], userId: json['userId'], completed: json['completed']);
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'userId': userId,
      'completed': completed,
    };
  }
}
