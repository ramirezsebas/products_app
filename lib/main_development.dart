import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_manager/app/app.dart';
import 'package:product_manager/bootstrap.dart';

void main() {
  bootstrap(() => const ProviderScope(child: App()));
}
