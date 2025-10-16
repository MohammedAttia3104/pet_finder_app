import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'CAT_API_KEY', obfuscate: true)
  static final String catApiKey = _Env.catApiKey;
}
