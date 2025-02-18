import 'package:dashboard/view/home_veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => DialogProvider()), // Ensure you have a DialogProvider
            // Uncomment and provide proper provider if needed:
            // ChangeNotifierProvider(create: (context) => NumbersProvider()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeVeiw(), // Ensure you have 'HomeView' widget
          ),
        );
      },
    );
  }
}

// Make sure to create this provider if it doesn't exist yet
class DialogProvider with ChangeNotifier {
  // Your state and logic for dialog management
}
