import 'package:harold_to_do_app/ui/screen/recycle_bin.dart';
import 'package:harold_to_do_app/ui/screen/task_completed_screen.dart';
import 'package:harold_to_do_app/utility/exports.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TaskCompletedScreen.id:
        return MaterialPageRoute(builder: (_) => const TaskCompletedScreen());
      default:
        return null;
    }
  }
}
