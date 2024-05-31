import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routingConfiguration = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [GoRoute(path: '/', builder: (context, _) => const Scaffold())]);
