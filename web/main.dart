import 'package:angular/application_factory.dart';
import 'package:ng_dart_ombdbapi/s_application_ui_module.dart';

void main() {
  applicationFactory()
      .addModule(new ApplicationUiModule())
      .run();
}