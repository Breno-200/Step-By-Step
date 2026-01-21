import 'package:go_router/go_router.dart';
import 'package:step_by_step/app/views/gerenciador-de-estado/set_state_example.dart';
import 'package:step_by_step/app/views/home_page.dart';
import 'package:step_by_step/app/views/pagina-inicio-loading/inicio_loading.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => InicioLoading()),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
    GoRoute(path: '/state', builder: (context, state) => SetStateExample()),
  ],
);
