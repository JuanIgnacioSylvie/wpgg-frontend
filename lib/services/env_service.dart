import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  String? getEnvironmentVar(String name) => dotenv.env[name];

  String get backendUrl => getEnvironmentVar('BACKEND_URL') ?? 'localhost:3000';

  String get backendProtocol =>
      getEnvironmentVar('BACKEND_PROTOCOL') ?? 'https';
}
