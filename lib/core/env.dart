import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get supaBaseUrl => dotenv.get('SUPABASE_URL');
  static String get supaBaseAnonKey => dotenv.get('SUPABASE_ANON_KEY');
}
