part of gcanvas_test;

void response_test() {
  group("[Response]", () {
    var resResponse;

    var address = new Address.create(
        id: 1,
        street: "48 Bignell street",
        suburb: "Gonville",
        city: "Wanganui",
        postcode: "4501",
        latitude: 169.201928,
        longitude: 49.21112,
        visited: false);

    var address2 = new Address.create(
        id: 2,
        street: "50 Bignell street",
        suburb: "Gonville",
        city: "Wanganui",
        postcode: "4501",
        latitude: 169.201928,
        longitude: 49.21112,
        visited: false);

    var address3 = new Address.create(
        id: 3,
        street: "52 Bignell street",
        suburb: "Gonville",
        city: "Wanganui",
        postcode: "4501",
        latitude: 169.201928,
        longitude: 49.21112,
        visited: false);

    var voter = new Resident.create(
        id: 1,
        firstname: "Bob",
        lastname: "Kate",
        //new DateTime(1973, 4, 10),
        address: address);

    var voter2 = new Resident.create(
        id: 2,
        firstname: "Bobby",
        lastname: "Kate",
        //new DateTime(1973, 4, 10),
        address: address2);

    var voter3 = new Resident.create(
        id: 3,
        firstname: "Bobby3",
        lastname: "Kate",
        //new DateTime(1973, 4, 10),
        address: address2);

    setUp(() {
      resResponse = new ResidentResponse.create(address: address);
    });


    test("response from address", () {
      var response = new ResidentResponse.create(address: address2);
      expect(response, isNotNull);
    });


    test("has correct address", () {
      expect(resResponse.address.id, equals(address.id));
    });



    test("response response", () {
      expect(resResponse.response, equals(""));
      resResponse.response = "No Answer";
      expect(resResponse.response, equals("No Answer"));
    });


    test("response reason", () {
      expect(resResponse.reason, equals(""));
      resResponse.reason = "No Answer";
      expect(resResponse.reason, equals("No Answer"));
    });


    test("response presentResidents", () {
      expect(resResponse.presentResidents, hasLength(0));
      resResponse.presentResidents.add(voter);
      expect(resResponse.presentResidents, hasLength(1));
    });


    test("response toMap()", () {
      var expected = {
        "id": 1,
        "response": "No Answer",
        "reason": "No Answer",
        "address": address.toMap(),
        "presentResidents": [voter.toMap()]
      };

      resResponse
        ..id = 1
        ..response = "No Answer"
        ..reason = "No Answer"
        ..presentResidents.add(voter);

      expect(resResponse.toMap(), equals(expected));
    });


    test("response fromMap()", () {
      var map = {
        "id": 1,
        "response": "No Answer",
        "reason": "No Answer",
        "address": address.toMap(),
        "presentResidents": [voter.toMap()]
      };

      var copy = new ResidentResponse.fromMap(map);

      expect(copy.response, equals("No Answer"));
      expect(copy.reason, equals("No Answer"));
      expect(copy.address.id, equals(address.id));
      expect(copy.presentResidents, hasLength(1));
      expect(copy.presentResidents[0].id, equals(voter.id));
    });
  });
}
