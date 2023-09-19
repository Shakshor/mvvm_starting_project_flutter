
abstract class BaseApiService{


  // get_api_network_result
  Future<dynamic> getGetApiResponse(String url);

  // post_api_network_result
  Future<dynamic> getPostApiResponse(String url, dynamic data);


}