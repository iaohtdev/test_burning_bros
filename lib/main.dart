import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/core/router/app_pages.dart';
import 'package:test_burning_bros/core/router/app_routes.dart';
import 'package:test_burning_bros/core/theme/theme.dart';
import 'package:test_burning_bros/di.dart';
import 'package:test_burning_bros/domain/repositories/favorite_repository.dart';
import 'package:test_burning_bros/domain/repositories/product_repository.dart';
import 'package:test_burning_bros/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:test_burning_bros/presentation/cubits/product/product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(getIt<ProductRepository>()),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(getIt<FavoriteRepository>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeApp,
        onGenerateRoute: AppPages.onGenerateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}
