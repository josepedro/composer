#include<stdlib.h>
#include<stdio.h>

void begin_draw(FILE *arquivo){
	fprintf(arquivo,"solid cube\n\t");
}

void end_draw(FILE *arquivo){
	fprintf(arquivo,"endsolid");
}

void draw_cube(FILE *arquivo/*, float positionX, float positionY, float positionZ, float height*/){
	float position[] = {1.000000,1.000000,1.000000};
	

	//Base face YZ
	fprintf(arquivo,"facet normal -1.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex -4.000000e+002 %.6fe+002 %.6fe+002\n\t\t",4.000000,4.000000);
	fprintf(arquivo,"vertex -4.000000e+002 %.6fe+002 -4.000000e+002\n\t\t",4.000000);
	fprintf(arquivo,"vertex 0.000000e+000 -4.000000e+002 %.6fe+002\n\t\t",4.000000);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	fprintf(arquivo,"facet normal -1.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 %.6fe+002\n\t\t",4.000000);
	fprintf(arquivo,"vertex 0.000000e+000 %.6fe+002 0.000000e+000\n\t\t",4.000000);
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	//Front of face XY
	fprintf(arquivo,"facet normal 0.000000e+000 0.000000e+000 1.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 %.6fe+002\n\t\t",position[0],position[1],position[2]);
	fprintf(arquivo,"vertex 0.000000e+000 %.6fe+002 %.6fe+002\n\t\t",position[1],position[2]);
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 %.6fe+002\n\t\t",position[0],position[2]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	fprintf(arquivo,"facet normal 0.000000e+000 0.000000e+000 1.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 %.6fe+002\n\t\t",position[0],position[2]);
	fprintf(arquivo,"vertex 0.000000e+000 %.6fe+002 %.6fe+002\n\t\t",position[1],position[2]);
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 %.6fe+002\n\t\t",position[2]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	//Front of face YZ
	fprintf(arquivo,"facet normal 1.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 0.000000e+000\n\t\t",position[0],position[1]);
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 %.6fe+002\n\t\t",position[0],position[1],position[2]);
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 0.000000e+000\n\t\t",position[0]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	fprintf(arquivo,"facet normal 1.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 0.000000e+000\n\t\t",position[0]);
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 %.6fe+002\n\t\t",position[0],position[1],position[2]);
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 %.6fe+002\n\t\t",position[0],position[2]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	//Base face XY
	fprintf(arquivo,"facet normal 0.000000e+000 0.000000e+000 -1.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex 0.000000e+000 %.6fe+002 0.000000e+000\n\t\t",position[1]);
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 0.000000e+000\n\t\t",position[0],position[1]);
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	fprintf(arquivo,"facet normal 0.000000e+000 0.000000e+000 -1.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 0.000000e+000\n\t\t",position[0],position[1]);
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 0.000000e+000\n\t\t",position[0]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	//Front of face XZ
	fprintf(arquivo,"facet normal 0.000000e+000 1.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 %.6fe+002\n\t\t",position[0],position[1],position[2]);
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 0.000000e+000\n\t\t",position[0],position[1]);
	fprintf(arquivo,"vertex 0.000000e+000 %.6fe+002 %.6fe+002\n\t\t",position[1],position[2]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	fprintf(arquivo,"facet normal 0.000000e+000 1.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex 0.000000e+000 %.6fe+002 %.6fe+002\n\t\t",position[1],position[2]);
	fprintf(arquivo,"vertex %.6fe+002 %.6fe+002 0.000000e+000\n\t\t",position[0],position[1]);
	fprintf(arquivo,"vertex 0.000000e+000 %.6fe+002 0.000000e+000\n\t\t",position[1]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	//Base face XZ
	fprintf(arquivo,"facet normal 0.000000e+000 -1.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 0.000000e+000\n\t\t",position[0]);
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 %.6fe+002\n\t\t",position[0],position[2]);
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n\t");
	
	fprintf(arquivo,"facet normal 0.000000e+000 -1.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"outer loop\n\t\t");
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 0.000000e+000\n\t\t");
	fprintf(arquivo,"vertex %.6fe+002 0.000000e+000 %.6fe+002\n\t\t",position[0],position[2]);
	fprintf(arquivo,"vertex 0.000000e+000 0.000000e+000 %.6fe+002\n\t\t",position[2]);
	fprintf(arquivo,"endloop\n\t");
	fprintf(arquivo,"endfacet\n");

}

int main(){

	
	FILE *arquivo;
	arquivo = fopen("cube.stl","w");
	
	begin_draw(arquivo);
	draw_cube(arquivo);
	end_draw(arquivo);
	
	fclose(arquivo);
	return 0;
}
