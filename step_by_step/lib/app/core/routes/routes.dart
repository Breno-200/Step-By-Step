import 'package:go_router/go_router.dart';
import 'package:step_by_step/app/ui/views/gerenciador-de-estado/change-notifier/change_notifier_example.dart';
import 'package:step_by_step/app/ui/views/gerenciador-de-estado/provider-example/provider_example_screen.dart';
import 'package:step_by_step/app/ui/views/gerenciador-de-estado/set-state/set_state_example.dart';
import 'package:step_by_step/app/ui/views/home_page.dart';
import 'package:step_by_step/app/ui/views/pagina-inicio-loading/inicio_loading.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => InicioLoading()),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
    GoRoute(path: '/state', builder: (context, state) => SetStateExample()),
    GoRoute(
      path: '/change-notifier',
      builder: (context, state) => ChangeNotifierExample(),
    ),
    GoRoute(
      path: '/provider-example',
      builder: (context, state) => ProviderExampleScreen(),
    ),
  ],
);
