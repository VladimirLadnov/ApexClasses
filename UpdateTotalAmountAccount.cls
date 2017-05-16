public class UpdateTotalAmountAccount {
    
    public void setAmount(List<Account> accs){
        List<Account> accsToUp = new List<Account>();
    
        List<Opportunity> opps = [SELECT Id, Amount, AccountId 
                                  FROM Opportunity 
                                  WHERE AccountId IN :accs];
        for(Account acc : accs){
             Decimal total = 0.0;
             for(Opportunity opp : opps){
                 
                 total = total + opp.Amount;
            }
            acc.TotalAmount__c = total;
            accsToUp.add(acc);
        }
        
        update accsToUp;
   
	}
}