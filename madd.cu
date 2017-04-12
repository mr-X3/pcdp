#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>
using namespace std;

__global__ void arrayadd(int *a,int *b,int *c){

	int row=threadIdx.y;
	int col=threadIdx.x;


	c[2*row+col]=a[2*row+col]+b[2*row+col];

}


int main()
{
int size=4;


int a[size],b[size],c[size];


int *h_a,*h_b,*h_c;


for(int i=0;i<size;i++)
{
	a[i]=i*8;
	b[i]=i*5;
	c[i]=0;
}




int gpu_size=sizeof(int)*size;


cudaMalloc((void**)&h_a,gpu_size);
cudaMalloc((void**)&h_b,gpu_size);
cudaMalloc((void**)&h_c,gpu_size);


cudaMemcpy(h_a,a,gpu_size,cudaMemcpyHostToDevice);
cudaMemcpy(h_b,b,gpu_size,cudaMemcpyHostToDevice);



arrayadd<<<1,4>>>(h_a,h_b,h_c);



cudaMemcpy(c,h_c,gpu_size,cudaMemcpyDeviceToHost);


cout<<"Matrix A\n";
for(int i=1;i<=size;i++)
{

	cout<<a[i-1]<<"\t";

	if(i%2==0)
	cout<<"\n";

}

cout<<"Matrix B\n";
for(int i=1;i<=size;i++)
{

	cout<<b[i-1]<<"\t";

	if(i%2==0)
	cout<<"\n";

}



cout<<"Addition is Matrix C\n";
for(int i=1;i<=size;i++)
{

	cout<<c[i-1]<<"\t";

	if(i%2==0)
	cout<<"\n";

}


}

