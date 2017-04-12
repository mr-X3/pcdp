#include<stdio.h>
#include<omp.h>
 int main()
{

int a[10];


#pragma omp parallel for
for(int i=0;i<10;i++)
 a[i]=i+1;


#pragma omp parallel for
for(int i=0;i<10;i++)
 printf("%d\n",a[i]);




#pragma omp parallel num_threads(5) shared(a)
{
	int tid=omp_get_thread_num();

	printf("Thread id %d is reading data %d \n",tid,a[tid]);	
	

	
	if(tid==4)
			{
	#pragma omp parallel for
	for(int i=tid;i<10;i++)
		printf("thread havind id %d read data %d\n",tid,a[i]);
			}

}




int semaphore=0;
int cnt=0;

while(cnt<5)
{

	
	#pragma omp parallel num_threads(5) shared(a) shared(semaphore)
{
	
	
		int tid=omp_get_thread_num();
		
		if(semaphore==0)
		{
			semaphore=1;
			printf("thread %d is writing\n",tid);

			printf("thread id %d writing is done\n",tid);
			semaphore=0;
			cnt++;
		}	
		else{printf("access denied %d \n",tid);
			}
}
}


return 0;
}
