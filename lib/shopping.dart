class Shopping{
  String _name;
  bool _checked=false;

  Shopping(this._name, this._checked);

  //Pour l'initialisation d'un nouvelle course crée
  Shopping.withoutChecked(this._name);


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  bool get checked => _checked;

  set checked(bool value) {
    _checked = value;
  }
}