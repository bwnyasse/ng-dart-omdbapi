/**
 * Copyright (c) 2016 ng-dart-omdbapi. All rights reserved
 *
 * REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS,
 * WITH OR WITHOUT MODIFICATION, ARE NOT PERMITTED.
 *
 * DO NOT ALTER OR REMOVE THIS HEADER.
 *
 * Created on : 11/05/16
 * Author     : bwnyasse
 *
 */
import 'package:unittest/unittest.dart';
import 'package:ng_dart_ombdbapi/utils/s_utils.dart';

main() {
  test('test SUtils#encodeMapQueryParametersAsUrl', () {
    Map map = {};
    map['p1'] = 'v1';
    map['p2'] = 'v2';
    map['p3'] = 'v3';

    String result = SUtils.encodeMapQueryParametersAsUrl(map);
    String expected = '?p1=v1&p2=v2&p3=v34';
    expect(expected, equals(result));
  });
}