class ItemModel {
  late int _id, _price;
  late String _title, _desc, _image;

  ItemModel(this._id, this._price, this._title, this._desc, this._image);

  set id(int value) {
    _id = value;
  }

  set image(value) {
    _image = value;
  }

  set desc(value) {
    _desc = value;
  }

  set title(String value) {
    _title = value;
  }

  set price(value) {
    _price = value;
  }

  String get title => _title;

  int get id => _id;

  get price => _price;

  get image => _image;

  get desc => _desc;

}