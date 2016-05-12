/**
 * Copyright (c) 2016 ng-dart-omdbapi. All rights reserved
 *
 * REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS,
 * WITH OR WITHOUT MODIFICATION, ARE NOT PERMITTED.
 *
 * DO NOT ALTER OR REMOVE THIS HEADER.
 *
 * Created on : 12/05/16
 * Author     : bwnyasse
 *
 */
part of ng_dart_ombdbapi;

class SDomUtils {

  static void activeCurrentWidgetMenu(String menuSelector) {
    List<AnchorElement> aElList = DOM.querySelectorAll(
        DOM.query("body"), ".widget-menu > li > a");
    aElList.forEach((el) {
      el.classes.remove('active');
    });

    AnchorElement aEl = DOM.query(menuSelector);
    aEl.classes.add('active');
  }
}