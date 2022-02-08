package model;

public class Calculator {
    public static float calculate (float firstNum,float secondNum,char operator){
       switch (operator){
           case '+':
               return firstNum + secondNum;
           case '-':
               return firstNum - secondNum;
           case '*':
               return firstNum * secondNum;
           case '/':
               if (secondNum !=0){
                   return firstNum / secondNum;
               }else {
                   throw new RuntimeException("Can't divide by zero");
               }
           default:
               throw new RuntimeException("Invalid operation");
       }
    }

}
