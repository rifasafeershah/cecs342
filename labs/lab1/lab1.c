// CECS 342 Lab 1 Quicksort and Mergesort in C vs Haskell
#include <stdio.h> 
#include <stdlib.h> 

// Quicksort functions begin (swap, partition, quickSort)

// A utility function to swap two elements 
void swap(int* a, int* b) 
{ 
    int t = *a;  // holds a in a temp variable
    *a = *b;  //sets a to the value of b
    *b = t;  //sets b to the value of temp (a)
} 
  
/* This function takes last element as pivot, places 
   the pivot element at its correct position in sorted array, and places all smaller (smaller than pivot) to left of pivot and all greater elements to right of pivot */
int partition (int arr[], int low, int high) 
{ 
    int pivot = arr[high];    // pivot 
    int i = (low - 1);  // Index of smaller element 
  
    for (int j = low; j <= high- 1; j++) // looping through array
    { 
        // If current element is smaller than the pivot 
        if (arr[j] < pivot) 
        { 
            i++;    // increment index of smaller element 
            swap(&arr[i], &arr[j]); //swap elements at i and j
        } 
    } 
    swap(&arr[i + 1], &arr[high]); //swaps the elements
    return (i + 1); //return index + 1
} 
  
/* The main function that implements QuickSort 
 arr[] --> Array to be sorted, 
  low  --> Starting index, 
  high  --> Ending index */
void quickSort(int arr[], int low, int high) 
{ 
    if (low < high) //make sure length > 1
    { 
        int pi = partition(arr, low, high);  // pi is partitioning index, arr[p] is now at right place 
        quickSort(arr, low, pi - 1); //quicksort elements at index less than pi
        quickSort(arr, pi + 1, high); //quicksort elements at index greater than pi
    } 
} 


/* The merge method merges two subarrays of arr[]. 
 First subarray is arr[l..m] 
 Second subarray is arr[m+1..r] */
void merge(int arr[], int l, int m, int r) 
{ 
    int i, j, k;  //i = left array index, j= right array index, k= main array index
    int n1 = m - l + 1; //length of left half of the main array
    int n2 = r - m; //length of right half of the main array
    int L[n1], R[n2]; // create temp arrays 
    for (i = 0; i < n1; i++) //Loop through left half of array
        L[i] = arr[l + i];  //Copy left half data to temp arrays L[]
    for (j = 0; j < n2; j++) //Loop through right half of array
        R[j] = arr[m + 1 + j]; //Copy right half data to temp arrays R[]
    i = 0; // Initial index of first subarray 
    j = 0; // Initial index of second subarray 
    k = l; // Initial index of merged subarray 
    while (i < n1 && j < n2) { //loop through left and right halves
        if (L[i] <= R[j]) { //if left element at i is larger than the right element at j
            arr[k] = L[i]; //copy left array element into merged array at position k
            i++; //increment left array index i
        } else { //otherwise if left element at i is smaller than the right element at j
            arr[k] = R[j]; //copy left array element into merged array at position k
            j++; //increment left array index i
        } 
        k++; //after each comparision and replacement, increment merged array index k
    } 
    while (i < n1) { //while there are still elements leftover in left array
        arr[k] = L[i]; //copies left array element into merged array at position k
        i++; //increment left array index i
        k++; //increment merged array index k
    } 
    while (j < n2) { //while there are still elements leftover in right array
        arr[k] = R[j]; //copies right array element into merged array at position k
        j++; //increment left array index i
        k++; //increment merged array index k
    } 
} 
  
/* Function to sort array using merge sort algorithm */
void mergeSort(int arr[], int l, int r) // l is for left index and r is right index of the sub-array of arr to be sorted
{ 
    if (l < r) { 
        // Same as (l+r)/2, but avoids overflow for 
        // large l and h 
        int m = l + (r - l) / 2; //gets the index of the midpoint of the array
        mergeSort(arr, l, m); //sorting the first half of the array
        mergeSort(arr, m + 1, r); //sorting the half of the array
        merge(arr, l, m, r); //merge the sorted first half and sorted second half
    } 
} 

/* Function to print an array (used by quicksort and mergesort)*/
void printArray(int arr[], int size) // Takes integer array and size to know how many times to iterate over it (already calculated size)
{ 
  printf("%c",'['); // %c to print char
    for (int i=0; i < size; i++) {// Iterate over entire array
      if (i<size-1) // Print a comma if not last element
        printf("%d,", arr[i]); // Print each element
      else // Last element so don't print comma
        printf("%d", arr[i]); // Print each element
    }
  printf("%c", ']'); // %c to print char
} 

/* Driver program to test above functions */
int main() 
{ 
    int arr[] = {4, 65, 2, -31, 0, 99, 2, 83, 782, 1}; // Given array
    int n = sizeof(arr)/sizeof(arr[0]); // sizeof in C gives number of bytes, so dividing sizeof(arr) by number of bytes gives number of elements in the array 
    quickSort(arr, 0, n-1); // Run quick sort on array
    printf("\nQuick Sort\n"); //Quick Sort statement printout
    printArray(arr, n); // Print array contained in brackets and comma-separated
  
    mergeSort(arr, 0, n-1); // Run merge sort on array
    printf("\nMerge Sort\n"); //Merge Sort statement printout
    printArray(arr, n); // Print array contained in brackets and comma-separated
    return 0; // main function in C always returns int value
} 
