/**
 * Copyright (c) 2016 ng-dart-omdbapi. All rights reserved
 *
 * REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS,
 * WITH OR WITHOUT MODIFICATION, ARE NOT PERMITTED.
 *
 * DO NOT ALTER OR REMOVE THIS HEADER.
 *
 * Created on : 10/05/16
 * Author     : bwnyasse
 *
 */

class SUtils {

  /**
   * Transform a map of queries to a good url pattern
   *
   * Example : ?param1=value1&param2=value2
   */
  static String encodeMapQueryParametersAsUrl(Map data) =>
      "?" + data.keys.map((key) => "${Uri.encodeComponent(key)}=${Uri
          .encodeComponent(data[key])}").join("&");

}
