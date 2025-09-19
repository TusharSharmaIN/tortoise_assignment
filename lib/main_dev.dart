
import 'package:tortoise_assignment/app.dart';
import 'package:tortoise_assignment/config.dart';

Future<void> main() async {
  await initialSetup(flavor: Flavor.dev);
  runAppWith();
}
