import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list/repositories/models/todo.dart';

class ToDoRepositories {
  Future<void> setTodo(String title, String description, DateTime finishDate) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('tasks').insert({
      'user_id': client.auth.currentUser!.id,
      'title': title,
      'description': description,
      'finishDate': finishDate.toIso8601String(),
      'isReady': false,
    });

    return;
  }

  Future<List<ToDo>> getTodoList() async {
    final SupabaseClient client = Supabase.instance.client;
    final response =
        await client.from('tasks').select('*').order('isReady', ascending: true).order('created_at', ascending: false);

    final List<ToDo> todoList = response
        .map((e) => ToDo(
              id: e['id'],
              title: e['title'],
              description: e['description'],
              finishDate: DateTime.parse(e['finishDate']),
              isReady: e['isReady'],
            ))
        .toList();
    return todoList;
  }

  Future<void> updateTodo(int id, bool isReady) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('tasks').update({'isReady': isReady}).eq('id', id);

    return;
  }
}
