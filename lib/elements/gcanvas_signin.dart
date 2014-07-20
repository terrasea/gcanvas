import 'dart:html' show Event, window;

import 'package:polymer/polymer.dart';// show CustomTag, PolymerElement, published, observable;

import 'package:paper_elements/paper_input.dart';

import 'package:gcanvas/gcanvas.dart' show UserCtrl, User;

import 'dart:html';

@CustomTag('gcanvas-signin')
class GCanvasLoggonElement extends PolymerElement {
  @published bool authenticated = false;
  @published UserCtrl userCtrl = new UserCtrl.create();

  @observable User user = new User.blank();
  @observable String email;
  @observable String password;

  GCanvasLoggonElement.created() : super.created() { print('created signin'); }


  void attached() {
    super.attached();
  }

  authenticate(Event e) {
    userCtrl.userLogin(email, password).then((result) {
      print(result);
      if(result) {
        user = new User("James", "Hurford", email);
        fireAuthenticated();
      } else {
        user = new User.blank();
        fireNotAuthenticated();
      }
    });
  }


  fireAuthenticated() {
    fire("authenticated", detail: user);
    authenticated = true;
    print("authenticated");
  }


  fireNotAuthenticated() {
    fire('not-authenticated', detail: user);
    authenticated = false;
  }


  fireNotVerified() {
    fire("not-verified", detail: user);
    authenticated = false;
  }
}