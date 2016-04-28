part of ng_dart_ombdbapi;

@Component(
    selector: 'detail-route-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/detail/detail_route_cmp.html',
    directives: const [MovieDetailCmp])
class DetailRouteCmp implements OnInit {

  final SOMDBService _service;
  final RouteParams _routeParams;

  DetailRouteCmp(this._service, this._routeParams);

  @override
  void ngOnInit() {
    //
    var title = _routeParams.get('title');
    var year = _routeParams.get('year');
    print(title);
    print(year);
    _service.findMovieByTitle(title, year);
  }

}