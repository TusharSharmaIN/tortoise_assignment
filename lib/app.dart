import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tortoise_assignment/application/product/product_bloc.dart';
import 'package:tortoise_assignment/config.dart';
import 'package:tortoise_assignment/locator.dart';
import 'package:tortoise_assignment/presentation/router/route.dart';
import 'package:tortoise_assignment/presentation/theme/theme_data.dart';

Future<void> initialSetup({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  final config = locator<Config>();
  config.appFlavor = flavor;
}

void runAppWith() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (context) => locator<ProductBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        theme: appThemeData,
        title: locator<Config>().appName,
        debugShowCheckedModeBanner: false,
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        ),
      ),
    );
  }
}
