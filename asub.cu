#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>
using namespace std;

__global__ void arrayadd(int *a,int *b,int *c){

	int tid=threadIdx.x;

	if(tid<100)
	{
		c[tid]=a[tid]-b[tid];
	}

}


int main()
{
int size=100;


int a[size],b[size],c[size];


int *h_a,*h_b,*h_c;


for(int i=0;i<size;i++)
{
	a[i]=i*8;
	b[i]=i*7;
	c[i]=0;
}




int gpu_size=sizeof(int)*size;


cudaMalloc((void**)&h_a,gpu_size);
cudaMalloc((void**)&h_b,gpu_size);
cudaMalloc((void**)&h_c,gpu_size);



cudaMemcpy(h_a,a,gpu_size,cudaMemcpyHostToDevice);
cudaMemcpy(h_b,b,gpu_size,cudaMemcpyHostToDevice);



arrayadd<<<1,1024>>>(h_a,h_b,h_c);



cudaMemcpy(c,h_c,gpu_size,cudaMemcpyDeviceToHost);




for(int i=0;i<size;i++)
{

	cout<<a[i]<<" - "<<b[i]<<" = "<<c[i]<<"\n";
}


}

