import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:watch_it/core/constants/supabase_keys.dart';

class SupabaseConfig {
  final supabase = Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: SupabaseKeys.url,
      anonKey: SupabaseKeys.anonKey,
    );
  }
}
