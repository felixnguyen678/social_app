import 'package:flutter/material.dart';
import 'package:social_app/modules/blocs/list_categories_bloc.dart';
import 'package:social_app/modules/blocs/list_posts_bloc.dart';
import 'package:social_app/modules/models/category.dart';
import 'package:social_app/modules/models/post.dart';
import 'package:social_app/modules/widgets/post_item.dart';

class ListCategoriesPage extends StatefulWidget {
  const ListCategoriesPage({Key? key}) : super(key: key);

  @override
  _ListCategoriesPageState createState() => _ListCategoriesPageState();
}

class _ListCategoriesPageState extends State<ListCategoriesPage> {
  final _categoryBloc = ListCategoresBloc();

  @override
  void initState() {
    super.initState();
    _categoryBloc.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List categories page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: _buildLogo(),
        onPressed: () {},
      ),
      body: StreamBuilder<List<Category>?>(
        stream: _categoryBloc.postsStream,
        builder: (context, snapshot) {
          print('snapshot ${snapshot.data}');
          if (snapshot.hasData) {
            final categories = snapshot.data;
            return ListView.builder(
              itemBuilder: (_, int index) {
                final item = categories![index];
                final name = item.title;
                final id = item.id ?? '';
                return Text(
                  '$name',
                  key: Key(id),
                );
              },
              itemCount: categories?.length ?? 0,
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: 64,
      height: 64,
      child: Image.asset('assets/images/flutter_logo.png'),
    );
  }
}
