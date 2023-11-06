import 'package:harold_to_do_app/utility/exports.dart';


class Task extends Equatable {
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;
  final String id;
  final String title;
  final String date;
  final String subTitle;

  Task({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.id,
    bool? isDeleted,
    bool? isDone,
    bool? isFavorite,
  }) {
    this.isDeleted = isDeleted ?? false;
    this.isDone = isDone ?? false;
    this.isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    bool? isDone,
    bool? isDeleted,
    String? title,
    String? subTitle,
    String? date,
    bool? isFavorite,
    String? id,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      date: date ?? this.date,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'title': title,
      'subTitle': subTitle,
      'isFavorite': isFavorite,
      'date': date,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      isFavorite: json['isFavorite'],
      subTitle: json['subTitle'],
      isDeleted: json['isDeleted'],
      isDone: json['isDone'],
    );
  }

  @override
  List<Object?> get props =>
      [title, subTitle, isDeleted, isDone, isFavorite, date];
}
