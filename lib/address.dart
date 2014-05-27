library gcanvas.address;

import 'package:observe/observe.dart' show reflectable, observable, Observable, ChangeNotifier;

import 'debug.dart';
import 'package:gcanvas/resident.dart';

@reflectable
class Address extends Observable {
  @reflectable String id;
  @reflectable String address1;
  @reflectable String address2;
  @reflectable String address3;
  @reflectable String city;
  @reflectable String postcode;
  @reflectable int meshblock;
  @reflectable int electorate;
  @reflectable num latitude;
  @reflectable num longitude;
  @observable bool visited = false;
  @reflectable List<Resident> residents = [];


  Address(
      this.id,
      this.address1,
      this.address2,
      this.address3,
      this.city,
      this.postcode,
      this.meshblock,
      this.electorate,
      this.latitude,
      this.longitude,
      [this.visited,
       this.residents]
  );



  /*
   * Factory constructor to help future proof this, and minimise refactoring
   * problems
   *
   * Allow for flexibility in what an address type is,
   * ie it can return anything, being a factory method
   */
  factory Address.create({
      String id: "-1",
      String address1: "",
      String address2: "",
      String address3: "",
      String city: "",
      String postcode: "",
      int meshblock: -1,
      int electorate: -1,
      num latitude: 0,
      num longitude: 0,
      bool visited: false,
      List<Resident> residents: null}) {
    residents = residents != null ? residents : [];
    return new Address(
          id,
          address1,
          address2,
          address3,
          city,
          postcode,
          meshblock,
          electorate,
          latitude,
          longitude,
          visited,
          residents
        );
  }


  /* For converting to an address after fetching data from the local browser
   * Store.
   *
   * It's no good having a factory create method if the fromMap isn't also a
   * factory method.  All it does is create an address using the create method
   * after extracting the fields from the map.
   */
  factory Address.fromMap(Map map) {
    if(map != null) {
      safariPrint("Address.fromMap");
      var id = map['id'];
      safariPrint("Address.fromMap2");
      var address1 = map['address1'];
      safariPrint("Address.fromMap3");
      var address2 = map['address2'];
      safariPrint("Address.fromMap4");
      var address3 = map['address3'];
      safariPrint("Address.fromMap5");
      var city = map['city'];
      safariPrint("Address.fromMap6");
      var postcode = map['postcode'];
      safariPrint("Address.fromMap7");
      var meshblock = map['meshblock'];
      safariPrint("Address.fromMap8");
      var electorate = map['electorate'];
      safariPrint("Address.fromMap9");
      var latitude = map['latitude'];
      safariPrint("Address.fromMap10");
      var longitude = map['longitude'];
      safariPrint("Address.fromMap11");
      var visited = map['visited'];
      safariPrint("Address.fromMap12");
      var residents = map['residents'].map((mapped) => new Resident.fromMap(mapped)).toList();
      safariPrint("Address.fromMap13");

      return new Address.create(
                            id: id,
                            address1: address1,
                            address2: address2,
                            address3: address3,
                            city: city,
                            postcode: postcode,
                            meshblock: meshblock,
                            electorate: electorate,
                            latitude: latitude,
                            longitude: longitude,
                            visited: visited,
                            residents: residents
      );
    }
  }


  /*
   * For use in storing the data in the browser Store.
   */
  Map toMap() {
    return {
      "id": id,
      "address1": address1,
      "address2": address2,
      "address3": address3,
      "city": city,
      "postcode": postcode,
      "meshblock": meshblock,
      "electorate": electorate,
      "latitude": latitude,
      "longitude": longitude,
      "visited": visited,
      "residents": residents.map((resident) => resident.toMap()).toList()
    };
  }
}
