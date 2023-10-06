class ResponseModel {
  bool _isSuccess;
  String _message;

  ResponseModel(this._isSuccess, this._message);

  bool get isSuccess => _isSuccess;
  String get message => _message;

/* This For convert From json to model or from model to json
  ResponseModel.fromJson(Map<String, dynamic> json) {
    _isSuccess = json[''];
    _message = json[''];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data[''] = _isSuccess;
    data[''] = _message;
    return data;
  }
  */
}
