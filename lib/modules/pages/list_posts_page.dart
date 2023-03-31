import 'package:flutter/material.dart';
import 'package:social_app/modules/blocs/list_posts_bloc.dart';
import 'package:social_app/modules/models/post.dart';
import 'package:social_app/modules/widgets/post_item.dart';

class ListPostsPage extends StatefulWidget {
  const ListPostsPage({Key? key}) : super(key: key);

  @override
  _ListPostsPageState createState() => _ListPostsPageState();
}

class _ListPostsPageState extends State<ListPostsPage> {
  final _postsBloc = ListPostsBloc();

  @override
  void initState() {
    super.initState();
    _postsBloc.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List posts page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: _buildLogo(),
        onPressed: (){

        },
      ),
      body: StreamBuilder<List<Post>?>(
        stream: _postsBloc.postsStream,
        builder: (context, snapshot) {
          print('snapshot ${snapshot.data}');
          if (snapshot.hasData) {
            final posts = snapshot.data;
            return ListView.builder(
              itemBuilder: (_, int index) {
                final item = posts![index];
                return PostItem(
                  height: 200,
                  url: item.images?.first.url ?? '',
                  description: item.description!,
                );
              },
              itemCount: posts?.length ?? 0,
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

  Widget _buildLogo(){
    return SizedBox(
      width: 64,
      height: 64,
      child: Image.asset('assets/images/flutter_logo.png'),
    );
  } 
}
