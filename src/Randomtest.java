import java.util.Scanner;

public class Randomtest {
	public static String longestString(String str)  
	{
        String[] strList = str.split(" ");
        String longestString = "";
        for (String a : strList) {
        	int newLen=a.length();
        	int maxLen=0;
        	if(newLen>maxLen) {
        		longestString=a;
        	}
        	else if(newLen==maxLen) {
        		longestString=longestString;
        	}
        }
        System.out.println(longestString);
		return longestString;  
		
	}
	
	
	public static StringBuilder newString(String longestString)  
	{
		// String newString = longestString.reverse();

		StringBuilder input1 = new StringBuilder();
		StringBuilder newString = new StringBuilder("Working");
		
		  
        // append a string into StringBuilder input1
        input1.append(longestString);
  
        // reverse StringBuilder input1
        input1.reverse();
        
        
     // append a string into StringBuilder input1
        newString.append(input1);
        
		
		return newString;  
		
	}
	
	
	
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter String:");

	    // String input
	    String str = sc.nextLine();
	    
	    String longestString=longestString(str);
	    StringBuilder newString=newString(longestString);
	    System.out.println(newString);
	}
}
