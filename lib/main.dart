import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/game/bloc/game_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/game/bloc/game_event.dart';
import 'package:flutter_technical_assesment_repalogic/products_list/bloc/product_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/products_list/repository/product_repository.dart';
import 'package:flutter_technical_assesment_repalogic/products_list/ui/product_list.dart';
import 'package:flutter_technical_assesment_repalogic/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/pages/todo_page.dart';
import 'package:flutter_technical_assesment_repalogic/weather/data/repositories/wether_repository.dart';
import 'package:flutter_technical_assesment_repalogic/weather/presentation/bloc/weather_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/weather/presentation/pages/weather_page.dart';
import 'features/dashboard/presentation/dashboard_page.dart';
import 'game/ui/game_page.dart';

void main() {

  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (_) => WeatherBloc(WeatherRepository()),
          ),
          BlocProvider<TodoBloc>(
            create: (_) => TodoBloc(TodoRepositoryImpl()),
          ),
          BlocProvider<GameBloc>(
            create: (_) => GameBloc()..add(LoadGame()),
          ),
          BlocProvider<ProductBloc>(
            create: (_) => ProductBloc(ProductRepository()),
          ),
        ],
        child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      title: 'Mini App',
      routes: {
        '/': (_) => DashboardPage(),
        '/weather': (_) => WeatherPage(),
        '/todo': (_) => TodoPage(),
        '/game': (_) => GamePage(),
        '/products': (_) => ProductsPage(),
      },
    );
  }
}