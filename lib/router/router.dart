import 'routes/routes.dart';

class _Router {
  final Function routeImageDetails = RouteImageDetails.getRoute;
  final Function routeFavorites = RouteFavorites.getRoute;
}

final router = _Router();
