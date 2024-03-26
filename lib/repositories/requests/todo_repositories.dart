import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories.dart';

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

  Future<void> markTodo(int id, bool isReady) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('tasks').update({'isReady': isReady}).eq('id', id);

    return;
  }

  Future<void> updateTodo(int id, String title, String description, DateTime finishDate) async {
    final SupabaseClient client = Supabase.instance.client;
    await client
        .from('tasks')
        .update({'title': title, 'description': description, 'finishDate': finishDate.toIso8601String()}).eq('id', id);

    return;
  }

  Future<void> deleteTodo(int id) async {
    final SupabaseClient client = Supabase.instance.client;
    await client.from('tasks').delete().eq('id', id);

    return;
  }

  Future<List<ToDo>> filteringTodoList(int parameter, bool hideDoneTasks) async {
    final SupabaseClient client = Supabase.instance.client;
    List<Map<String, dynamic>>? response;
    switch (parameter) {
      case 1:
        response = await client
            .from('tasks')
            .select('*')
            .order('isReady', ascending: true)
            .order('finishDate', ascending: true);
        break;
      case 2:
        response = await client
            .from('tasks')
            .select('*')
            .order('finishDate', ascending: true)
            .order('isReady', ascending: true)
            .order('created_at', ascending: false);
        break;
      case 3:
        response = await client.from('tasks').select('*').order('created_at', ascending: false);
        break;
    }

    final List<ToDo> todoList = response!
        .where((e) => !hideDoneTasks || e['isReady'] == false)
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
}
