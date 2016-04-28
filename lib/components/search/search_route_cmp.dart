part of ng_dart_ombdbapi;

@Component(
    selector: 'search-route-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/search/search_route_cmp.html',
    directives: const [SearchMovieBoxCmp, SearchMovieResultCmp])
class SearchRouteCmp implements OnInit {

  @override
  void ngOnInit() {
  }

}