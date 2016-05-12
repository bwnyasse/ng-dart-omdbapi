part of ng_dart_ombdbapi;

@Component(
    selector: 'find-route-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/find/find_route_cmp.html',
    directives: const [FindMovieByTitleBoxCmp, FindMovieByTitleResultCmp])
class FindRouteCmp implements OnInit, AfterViewInit{

  @override
  void ngOnInit() {
  }


  @override
  ngAfterViewInit() {
    SDomUtils.activeCurrentWidgetMenu("#find-by-title-widget-menu-list-id");
  }
}