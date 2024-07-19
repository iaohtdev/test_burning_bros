import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/core/router/app_pages.dart';
import 'package:test_burning_bros/core/router/app_routes.dart';
import 'package:test_burning_bros/core/theme/theme.dart';
import 'package:test_burning_bros/di.dart';
import 'package:test_burning_bros/domain/repositories/product_repository.dart';
import 'package:test_burning_bros/presentation/cubits/post/post_cubit.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostCubit(getIt<ProductRepository>()),
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
