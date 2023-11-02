class Todo {
  String taskTitle;
  String subTitle;
  bool isCompleted;

  Todo({
    required this.taskTitle,
    required this.subTitle,
    this.isCompleted = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      taskTitle: json['taskTitle'],
      subTitle: json['subTitle'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskTitle': taskTitle,
      'subTitle': subTitle,
      'isCompleted': isCompleted,
    };
  }
}
