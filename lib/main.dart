import 'package:flutter/material.dart';
import 'package:pet_finder_app/pet_finder_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/utils/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  MyBlocObserver();
  runApp(const PetFinderApp());
}
