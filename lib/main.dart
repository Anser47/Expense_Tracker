import 'package:expense_tracker/widget/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kThemeColor = ColorScheme.fromSeed(seedColor: Colors.pink);
var kdarkColor = ColorScheme.fromSeed(
    seedColor: Colors.pink.shade900, brightness: Brightness.dark);
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {});
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kdarkColor,
        cardTheme: const CardTheme().copyWith(
            color: kdarkColor.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kdarkColor.primaryContainer,
              foregroundColor: kdarkColor.onPrimaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kThemeColor.primaryContainer,
              foregroundColor: kThemeColor.onPrimaryContainer),
        ),
        colorScheme: kThemeColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ).copyWith(
          color: kThemeColor.onPrimary,
          foregroundColor: kThemeColor.onPrimaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
            color: kThemeColor.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
      themeMode: ThemeMode.system,
    ),
  );
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//     );
//   }
// }
