public class Div {
    public static void Division(Integer marks1, Integer marks2, Integer marks3){
       
        Integer Percentage = (marks1+ marks2 +marks3)/3;
        Integer TotalMarks = (marks1+ marks2 +marks3);
        
        if(Percentage>=60){
            system.debug('Total Marks ='+ TotalMarks);
            system.debug('Percentage ='+ Percentage);
            system.debug('First Division');
        }else if(Percentage>=48){
            system.debug('Total Marks ='+ TotalMarks);
            system.debug('Percentage ='+ Percentage);
            system.debug('Second Division');
        }else if(Percentage>=36){
            system.debug('Total Marks ='+ TotalMarks);
            system.debug('Percentage ='+ Percentage);
            system.debug('Third Division');
        }else{
            system.debug('fail');
        }
    }
}