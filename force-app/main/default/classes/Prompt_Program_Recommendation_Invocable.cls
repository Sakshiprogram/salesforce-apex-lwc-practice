public class Prompt_Program_Recommendation_Invocable {
    
    
        @InvocableMethod(label='Program_Recommendation'
      description='returns JSON object of availible programs'
      CapabilityType='PromptTemplateType://einstein_gpt__salesEmail')
      
    public static List<Response> getPrompt(List<Request> requests) {
        Request input = requests[0];
        List<Response> responses = new List<Response>();
        Response output = new Response();
        List<Product2> listProduct = [Select Name,Description,Target_Clients__c from Product2];
        Map<string,list<sobject>> mapOfRecords = new Map<string,list<sobject>>{'Programs'=>listProduct};
        String myJSON = JSONGenerator.generateJSONContent(mapOfRecords);
        //String myJSON = JSON.serialize(mapOfRecords);
        output.prompt = myJSON;
        //output.prompt = mapOfRecords;
        //output.prompt = RawJSON.Myjson();
        //System.debug(myJSON);
        //output.prompt = JSON.serialize(listProduct,true);
        responses.add(output);
        system.debug(output);

        return responses;
    }
 
    // Type and API Name of all variables must match the template
    
      public class Request {
          @InvocableVariable(required=true)
          public User Sender;
          @InvocableVariable(required=true)
          public Contact Recipient;

          
      }

    public class Response {
        @InvocableVariable
        public String Prompt;
    }

}