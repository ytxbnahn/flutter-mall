import "package:flutter_mall/http/utils.dart";
import "package:flutter_mall/model/index.dart";

class Api {
  ///用户合同列表
  static const getIndex = 'mall/index';
}

class ApiClient {
  Future<IndexEntity> getIndex() async {
    var r = await HttpUtil().get(Api.getIndex);
    print(r);
    return IndexEntity.fromJson(r);
  }
}
