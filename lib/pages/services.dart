import 'package:http/http.dart'as http;
import 'DistrictData.dart';


class Services{
  static const String url='https://api.covid19india.org/v2/state_district_wise.json';

   static Future<List<DistrictData>> getData() async{
     try{
       final response=await http.get(url);
       if (200==response.statusCode) {
         final List<DistrictData> data=districtDataFromJson(response.body);
         return data;
       }else{
         return List<DistrictData>();
       }
     }catch(e){
       return List<DistrictData>();
     }
   }
}