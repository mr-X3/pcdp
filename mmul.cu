#include <iostream>

using namespace std;

#define BLOCK_SIZE 16

__global__ void gpuMM(int *A, int *B, int *C, int N)
{

	int row = blockIdx.y*blockDim.y + threadIdx.y;
	int col = blockIdx.x*blockDim.x + threadIdx.x;

	int sum = 0;
	for (int n = 0; n < N; ++n)
	    sum += A[row*N+n]*B[n*N+col];

	C[row*N+col] = sum;
}

int main(int argc, char *argv[])
{

	int N=2;

	cout << "Executing Matrix Multiplcation" << endl;
	cout << "Matrix size: " << N << "x" << N << endl;


	int hA[N*N],hB[N*N],hC[N*N];






	for (int j=0; j<N*N; j++){

			hA[j]=j;
			hB[j]=j;
			hC[j]=0;


	}


	int size = N*N*sizeof(int);

	int *dA,*dB,*dC;

	cudaMalloc((void**)&dA,size);
	cudaMalloc((void**)&dB,size);
	cudaMalloc((void**)&dC,size);

	dim3 threadBlock(4,4);
	dim3 grid(1,1);


	cudaMemcpy(dA,hA,size,cudaMemcpyHostToDevice);
	cudaMemcpy(dB,hB,size,cudaMemcpyHostToDevice);


	gpuMM<<<grid,threadBlock>>>(dA,dB,dC,N);


	cudaMemcpy(hC,dC,size,cudaMemcpyDeviceToHost);



	cout<<"Matrix A\n";
		for(int i=1;i<=N*N;i++)
		{

			cout<<hA[i-1]<<"\t";

			if(i%2==0)
			cout<<"\n";

		}


		cout<<"Matrix B\n";
			for(int i=1;i<=N*N;i++)
			{

				cout<<hB[i-1]<<"\t";

				if(i%2==0)
				cout<<"\n";

			}



	cout<<"Matrix C is \n";
	for(int i=1;i<=N*N;i++)
	{

		cout<<hC[i-1]<<"\t";

		if(i%2==0)
		cout<<"\n";

	}



	cout << "Finished." << endl;

}

