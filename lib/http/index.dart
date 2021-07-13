import "package:flutter_mall/http/utils.dart";
import "package:flutter_mall/model/index.dart";
import 'package:flutter_mall/model/base.dart';

class Api {
  ///用户合同列表
  static const getIndex = 'mall/index';
  static const getHotList = 'mall/hotList';
}

class ApiClient {
  Future<BaseResponse<IndexData>> getIndex() async {
    var r = await HttpUtil().get(Api.getIndex);
    return BaseResponse<IndexData>.fromJson(r);
  }

  Future<BaseResponse<HotPaginationResultType>> getHotList() async {
    var r = await HttpUtil()
        .post(Api.getHotList, data: {'pageNum': '1', 'pageSize': '20'});
    return BaseResponse<HotPaginationResultType>.fromJson(r);
  }
}
