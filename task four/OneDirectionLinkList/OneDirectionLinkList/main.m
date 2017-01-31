//
//  main.m
//  OneDirectionLinkList
//
//  Created by 谭瑞东 on 2017/1/31.
//  Copyright © 2017年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

//Declare a node struct
typedef struct _Node {
    int value;
    struct _Node *next;
} Node;

// Function to create a new node
Node *createNode(int value, Node *next){
    Node *node  = malloc(sizeof(Node));
    node->value = value;
    node->next = next;
    return node;
}

//Function to free the link list memory
void freeLinkListMemory(Node *first){
    Node *nodePointer = first, *tempNode = NULL;
    while (nodePointer != NULL) {
        tempNode = nodePointer;
        nodePointer = nodePointer->next;
        free(tempNode);
    }
}

//Function to display a given link list
void displayLinkList(Node *first){
    Node *temp = first;
    while(temp != NULL){
        printf("%d\n", temp->value);
        temp = temp->next;
    }
}

//Function to reverse the given link list
Node *reverseLinkList(Node *first){
    //if the first node is NULL, we will show a message and return NULL
    if (first == NULL){
        printf("It's an empty list");
        return first;
    }
    
    //Otherwise we will reverse the link list
    Node *nodePointer = first, *tempFirst = NULL, *tempNext = NULL;
    while (nodePointer != NULL) {
        tempNext = tempFirst;
        tempFirst = nodePointer;
        nodePointer = nodePointer->next;
        tempFirst->next = tempNext;
    }
    
    return tempFirst;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //First we initialize a one direction link list
        Node *first = NULL, *last = NULL, *temp = NULL;
        first = last = createNode(0, NULL);
        for(int i = 1; i<10; i++){
            temp = last;
            last = createNode(i, NULL);
            temp->next = last;
        }
        
        //Display the created list
        printf("The created link list is:\n");
        displayLinkList(first);
        
        //Reverse the list
        first = reverseLinkList(first);
        
        //Display the reversed list
        printf("The reversed link list is:\n");
        displayLinkList(first);
        
        //Free the memory
        freeLinkListMemory(first);
    }
    return 0;
}
