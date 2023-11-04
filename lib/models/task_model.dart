import 'package:harold_to_do_app/utility/exports.dart';

class Task extends Equatable {
  bool isDone;
  bool isDeleted;
    final String id;
  final String title;
  final String subTitle;
  

  Task({
    required this.title,
    required this.subTitle,   required this.id,
    bool? isDeleted,
    bool? isDone,
  })  : isDeleted = isDeleted ?? false,
        isDone = isDone ?? false;

  Task copyWith({
    bool? isDone,
    bool? isDeleted,
    String? title,
    String? subTitle,
      String? id,
  }) {
    return Task(
       id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
       'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'title': title,
      'subTitle': subTitle,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
      isDeleted: json['isDeleted'],
      isDone: json['isDone'],
    );
  }

  @override
  List<Object?> get props => [title, subTitle, isDeleted, isDone];

  
}
