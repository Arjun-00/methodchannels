//@dart = 2.9
import 'dart:convert';
Names namesFromJson(String str) => Names.fromJson(json.decode(str));
String namesToJson(Names data) => json.encode(data.toJson());
class Names {
  Names({
      String name, 
      NameObj nameObj, 
      List<NameArray> nameArray,}){
    _name = name;
    _nameObj = nameObj;
    _nameArray = nameArray;
}

  Names.fromJson(dynamic json) {
    _name = json['name'];
    _nameObj = json['nameObj'] != null ? NameObj.fromJson(json['nameObj']) : null;
    if (json['nameArray'] != null) {
      _nameArray = [];
      json['nameArray'].forEach((v) {
        _nameArray.add(NameArray.fromJson(v));
      });
    }
  }
  String _name;
  NameObj _nameObj;
  List<NameArray> _nameArray;

  String get name => _name;
  NameObj get nameObj => _nameObj;
  List<NameArray> get nameArray => _nameArray;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_nameObj != null) {
      map['nameObj'] = _nameObj.toJson();
    }
    if (_nameArray != null) {
      map['nameArray'] = _nameArray.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

NameArray nameArrayFromJson(String str) => NameArray.fromJson(json.decode(str));
String nameArrayToJson(NameArray data) => json.encode(data.toJson());
class NameArray {
  NameArray({
      String name,}){
    _name = name;
}

  NameArray.fromJson(dynamic json) {
    _name = json['name'];
  }
  String _name;

  String get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}

NameObj nameObjFromJson(String str) => NameObj.fromJson(json.decode(str));
String nameObjToJson(NameObj data) => json.encode(data.toJson());
class NameObj {
  NameObj({
      String name,}){
    _name = name;
}

  NameObj.fromJson(dynamic json) {
    _name = json['name'];
  }
  String _name;

  String get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}