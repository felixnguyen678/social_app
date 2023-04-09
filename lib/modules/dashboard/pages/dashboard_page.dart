import 'package:flutter/material.dart';
import 'package:social_app/blocs/app_state_bloc.dart';
import 'package:social_app/modules/dashboard/widgets/post_item_2.dart';
import 'package:social_app/modules/posts/blocs/list_posts_rxdart_bloc.dart';
import 'package:social_app/modules/posts/models/post.dart';
import 'package:social_app/providers/bloc_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ListPostsRxDartBloc? get bloc =>
      BlocProvider.of<ListPostsRxDartBloc>(context);
  AppStateBloc? get appStateBloc => BlocProvider.of<AppStateBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List posts page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              appStateBloc!.changeAppState(AppState.unAuthorized);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: StreamBuilder<List<Post>?>(
          stream: bloc!.postsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final posts = snapshot.data;
              return ListView.builder(
                itemBuilder: (_, int index) {
                  final item = posts![index];
                  return PostItem2(
                    // height: 200,
                    item: item,
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
          }),
    );
  }
}
