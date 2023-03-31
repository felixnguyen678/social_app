import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/blocs/chatty_bloc_observer.dart';
import 'package:social_app/modules/firebase/widgets/firebase_initializer.dart';
import 'package:social_app/modules/pages/list_categories_page.dart';
import 'package:social_app/modules/pages/list_posts_page.dart';

void main() {
  Bloc.observer = ChattyBlocObserver();
  runApp(const FirebaseInitializer(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListCategoriesPage(),
    );
  }
}
