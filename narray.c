#include<stdio.h>
#include<omp.h>
#define MAXTHREADS 10
#define ARRAYSIZE 74

int main(void)
{
 int a[]={1,4,7,9,12,15,17,19,22,24,28,29,31,35,39,44,46,49,51,53,56,59,62,64,66,68,71,73,75,77,79,81,83,85,89,90,94,96,98,100,102,104,106,107,110,112,113,116,119,123,127,128,129,134,136,138,149,156,157,159,162,165,169,170,173,175,178,181,184,187,189,190,193,196,200},i,j,found=0,key=190;
 double start_time,run_time;
 for(j=1;j<=5;j++)
        {
      omp_set_num_threads(j);
  found=0;
  start_time = omp_get_wtime();
  #pragma omp parallel private(i)
  {

    int start,noofsteps;
   #pragma omp single
    printf("\nNumber of threads in action: %d\n",j);

   if(found==0)
   {

     start=(omp_get_thread_num())*(ARRAYSIZE/omp_get_num_threads());
    noofsteps=start+(ARRAYSIZE/omp_get_num_threads());
    if(ARRAYSIZE%j!=0)
     noofsteps+=(ARRAYSIZE%j);
    for(i=start;i<noofsteps;i++){
     if(key==a[i]) {
      printf("\nKey has been found in %d thread at %d position\n",omp_get_thread_num(),i+1);
      found=1;
      break;
     }
    }

    }
  }
  run_time = omp_get_wtime() - start_time;
   printf("\n %f seconds %d threads \n ",run_time,j);
 }

return 0;
}
