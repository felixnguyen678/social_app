import 'package:flutter/material.dart';
import 'package:social_app/modules/authentication/pages/welcome_page.dart';
import 'package:social_app/modules/dashboard/pages/dashboard_page.dart';
import 'package:social_app/modules/posts/blocs/list_posts_rxdart_bloc.dart';
import 'package:social_app/providers/bloc_provider.dart';

class Routes {
  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // return _buildRoute(
        //   settings,
        //   const CreatePostPage(),
        // );
        return _buildRoute(
          settings,
          BlocProvider(
            bloc: ListPostsRxDartBloc()..getPosts(),
            child: const DashboardPage(),
          ),
        );
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          const WelcomePage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}
