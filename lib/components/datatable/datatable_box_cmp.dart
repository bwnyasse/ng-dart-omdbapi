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
    selector: 'datatable-box-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/datatable/datatable_box_cmp.html')
class DatatableBoxCmp {

  String searchValue;
  SOMDBService service;

  DatatableBoxCmp(this.service);

  searchMovie() {
    if (quiver_strings.isNotEmpty(searchValue)) {
      service.searchMovieWithApiForDatatable(searchValue);
    }
  }


}