

import Foundation

let responseCode = (4010, "Invalid file contents", 0x21451fff3b)

let explicitResponseCode: (Int, String, Double) = (4010, "Invalid file contents", 0x8fffffffffffffff)

print(type(of: responseCode))

let errorCode = (errorCode:4010, errorMessage:"Invalid file contents", offset:0x7fffffffffffffff)
print(errorCode.errorCode)

func getPartnerList() -> (statusCode:Int, description:String, metaData:(partnerStatusCode:Int, partnerErrorMessage:String, parterTraceId:String)) {
  
  return (503, "Service Unavailable", (32323, "System is down for maintainance until 2015-11-05T03:30:00+00:00", "5A953D9C-7781-427C-BC00-257B2EB98426"))
}

var result = getPartnerList()

result.statusCode

result.description

result.metaData.partnerErrorMessage

result.metaData.partnerStatusCode

result.metaData.parterTraceId
