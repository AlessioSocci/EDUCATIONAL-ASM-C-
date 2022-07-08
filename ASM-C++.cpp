// ASM-C++.cpp : Questo file contiene la funzione 'main', in cui inizia e termina l'esecuzione del programma.
//

#include "pch.h"
#include <iostream>


extern "C" void ArrayReverser(int* y, const int* x, int n);

extern "C" void ArraySum(void);

extern "C" void ArrayScan(void);

extern "C" int Adder(int addendum_a, int addendum_b, int addendum_c);

extern "C" int SignedDivMul(int factor_a, int factor_b, int* product, int* quotient, int* rem);

extern "C" void Adder_2(int addendum_a, int addendum_b, int addendum_c, int* s1, int* s2, int* s3);



int main()
{
    const int n = 10;
    int x[n], y[n];

    srand(41);

    for (int i = 0; i < n; i++)
    {
        x[i] = rand() % 1000;
    }

    ArrayReverser(y, x, n);

    printf("\n --- Array Reverser --- \n");

    for (int i = 0; i < n; i++)
    {
        printf("\n    i:   %5d     y:  %5d     x:   %5d", i, y[i], x[i]);
    }

    ArraySum();

    ArrayScan();

    int sum = Adder(2, 3, 5);

    printf("\n \n sum = %d \n", sum);

    int product = 0;
    int quotient = 0; 
    int rem = 0;

    int SignedDivMul_OK = SignedDivMul(- 21, 9, &product, &quotient, &rem);

    printf("\n \n SignedDivMul_OK = %d \n", SignedDivMul_OK);
    printf("\n \n product = = %4d \n", product);
    printf("\n \n quotient = %4d \n", quotient);
    printf("\n \n rem = %4d \n", rem);

    int a = 2, b = 3, c = 4;
    int s1, s2, s3;

    Adder_2(a, b, c, &s1, &s2, &s3);

    printf("\n Input a: %4d, b: %4d, c: %4d \n", a, b, c);
    printf("\n Output s1: %4d, s2 = sum of squared: %4d, s3 = sum of cube: %4d \n", s1, s2, s3);




    return 0;

}

