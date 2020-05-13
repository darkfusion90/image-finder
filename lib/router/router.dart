import 'package:searchimages/router/routes/Route-Downloads.dart';

import 'routes/routes.dart';

class _Router {
  final Function routeImageDetails = RouteImageDetails.getRoute;
  final Function routeFavorites = RouteFavorites.getRoute;
  final Function routeDownloads = RouteDownloads.getRoute;
}

final router = _Router();
