package com.spring.util;

public class RandomDateCreate {
	private int iUserBirthMonth;
    private int iUserBirthDay;
    
    public int getUserBirthMonth()
    {
        return this.iUserBirthMonth;
    }
    public int getUserBirthDay()
    {
        return this.iUserBirthDay;
    }
 
    public void setCalendars()
    {       
        int iMinMonth = 1;
        int iMaxMonth = 12;
        int iMinDay = 1;
        int iMaxDay = 31;
        
        int iRandomMonth = (int)(Math.random() * iMaxMonth - iMinMonth + 1) + iMinMonth;
        int iRandomDay = 0;
        
        switch (iRandomMonth) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            iRandomDay = (int) (Math.random() * iMaxDay - iMinDay + 1) + iMinDay; //최대 31일
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            iRandomDay = (int) (Math.random() * (iMaxDay - 1) - (iMinDay) + 1) + iMinDay; //최대 30일
            break;
        case 2:
            iRandomDay = (int) (Math.random() * (iMaxDay - 3) - (iMinDay) + 1) + iMinDay; //최대 28일
            break;
        default:
            System.out.println("1~12 달 이외의 값이 들어옴");
        }
        
        this.iUserBirthMonth = iRandomMonth;
        this.iUserBirthDay = iRandomDay;
    }
}
