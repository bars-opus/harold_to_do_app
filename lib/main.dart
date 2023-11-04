import 'package:harold_to_do_app/utility/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the custom delegate
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        home: const Home(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
