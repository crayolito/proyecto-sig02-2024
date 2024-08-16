import 'package:app_sig_proyect/features/map/presentation/screens/productStand/search-products-screen.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/welcome-screen.dart';
import 'package:app_sig_proyect/features/map/presentation/screens/Search/general-search.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (_) => const WelcomeScreen(),
  '/generalSearch': (_) => const GeneralSearchEngine(),
  '/standProductSearch': (_) => const SearchProductsStand(),
  // '/product-detail': (_) => const ViewProductScreen(),
};
