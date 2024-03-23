class ToDo {
  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.finishDate,
    required this.isReady,
  });

  final int id;
  final String title;
  final String description;
  final DateTime finishDate;
  final bool isReady;
}
