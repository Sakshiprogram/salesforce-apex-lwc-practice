public class JSONGenerator {
    
        
  public static string generateJSONContent(Map<string,list<sobject>> mapOfRecords) {
        // Create a JSONGenerator object.
        // Pass true to the constructor for pretty print formatting.
        System.JSONGenerator gen = System.JSON.createGenerator(true);
        
      String j = '{';
        for(string s : mapOfRecords.keyset()){
           j += '"' + s + '" :[' ;
            for(sobject o :mapOfRecords.get(s)){
                j += '{' ; 
            Map<String, Object> fieldsToValue = o.getPopulatedFieldsAsMap(); 
                For(string f :fieldsToValue.keyset()){
                   j += '"' + f + '" :"' + fieldsToValue.get(f) + '",'; 
                }
                j = j.removeEnd(',');
                j += '},' ; 
            }
             j = j.removeEnd(',');
            j += '],';
        }
       j = j.removeEnd(',');
       j += '}' ;
      system.debug(j);
        return j; 
        
    }
    
    
    
}