package com.kaishengit.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DateUtil {

	public static String getNow() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	
	/*public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String str=	sdf .format(new Date()).toString();
	//System.out.println(str);
	

	}*/
	
	
	public static  String  times(String str,String name) throws ParseException{
		
		String states = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String systemTime = sdf .format(new Date()).toString();
	   // ����ȡ����ʱ���ַ���ת��Ϊʱ���ʽ���ַ��� 
	    Date begin=sdf.parse(str);
	    
	    Date end = sdf.parse(systemTime);
	    long between=(end.getTime()-begin.getTime())/1000;//����1000��Ϊ��ת������
	       
	       long day1=between/(24*3600);
	       long hour1=between/3600;
	       long minute1=between/60;
	       long second1=between/60;
	       
	       if(between<=1){
	    	   
	    	  states=name+" "+"�ոշ���";
	       }else if(second1<=1&&second1>0){
	    	  states=name+second1+"��ǰ����";
	    	   
	       }else if(1<minute1&&minute1<=60){
	    	states=name+" "+minute1+"����ǰ����"; 
	    	   
	       }else if(1<=hour1&& hour1<24){
	    	  states=name+" "+hour1+"Сʱǰ����";
	    	   
	    	   
	    	   
	       }else if (day1>=1&&day1<30){
	    	   
	    	 states=name+" "+day1+"��ǰ����";
	       }
	       
	       return states;
/*	    if(between<1){
	    	String states="�ո�";
	    	
	    }else if(between>1){
	    	if(second1<=60){
	    		String states=second1+"ǰ";
	    		
	    	}else if(second1>60){
	    		if(minute1>1&&minute1<=60){
	    			
	    			String states=minute1+"ǰ";
	    			
	    		}else if(){
	    			
	    			
	    		}
	    		
	    	}
	    	
	    	
	    }
	
	}*/
	}
	
}
