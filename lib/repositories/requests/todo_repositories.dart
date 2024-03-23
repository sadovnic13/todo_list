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
}
