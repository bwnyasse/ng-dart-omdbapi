/**
 * Copyright (c) 2016 ng-dart-omdbapi. All rights reserved
 * 
 * REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS,
 * WITH OR WITHOUT MODIFICATION, ARE NOT PERMITTED.
 * 
 * DO NOT ALTER OR REMOVE THIS HEADER.
 * 
 * Created on : 08/06/16
 * Author     : bwnyasse
 *  
 */
part of ng_dart_ombdbapi;

@Component(
    selector: 'datatable-route-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/datatable/datatable_route_cmp.html',
    directives: const [DatatableBoxCmp, DatatableResutMovieCmp])
class DatatableRouteCmp implements OnInit , AfterViewInit{

  @override
  void ngOnInit() {
  }


  @override
  ngAfterViewInit() {
    SDomUtils.activeCurrentWidgetMenu("#datatable-api-widget-menu-list-id");
  }
}