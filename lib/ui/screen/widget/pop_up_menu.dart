import 'package:harold_to_do_app/utility/exports.dart';

class PopUpbutton extends StatelessWidget {
  final VoidCallback cancelDeletCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTextCallback;
  final VoidCallback restoreTextCallback;

  final Task task;

  const PopUpbutton({
    super.key,
    required this.task,
    required this.cancelDeletCallback,
    required this.likeOrDislike,
    required this.editTextCallback,
    required this.restoreTextCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () => editTextCallback(),
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () => likeOrDislike(),
                          icon: task.isFavorite == false
                              ? const Icon(Icons.bookmark_add_outlined)
                              : const Icon(Icons.bookmark_remove),
                          label: task.isFavorite == false
                              ? const Text('Add to bookmark')
                              : const Text('Remove to bookmark'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () => cancelDeletCallback(),

                          // => RemoveTasks(task: task),
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete')))
                ])
            : ((context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () => restoreTextCallback(),
                          icon: const Icon(Icons.restore_from_trash),
                          label: const Text('Restore'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () => cancelDeletCallback(),
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete')))
                ]));
  }
}
