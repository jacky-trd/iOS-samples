//
//  main.m
//  FindPrimeNumber
//
//  Created by 谭瑞东 on 2017/1/31.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

//Function to determine if a number is prime number or not
BOOL isPrimeNumber(int number){
    //All the prime numbers are larger than 2
    if(number < 2){
        return false;
    }
    
    //Since n = sqrt(n)*sqrt(n), we only need to loop to sqrt(n)
    for(int i = 2; i <= sqrt(number); i++){
        if(number % i == 0){
            return false;
        }
    }
    return true;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("The prime numbers within 100 are:\n");
        //Find all the prime numbers within 1000000 and print them
        for(int i = 0; i <= 1000000; i++){
            if(isPrimeNumber(i)){
                printf("%d\n",i);
            }
        }
    }
    return 0;
}
