/*Unit of measure is millimeter*/

#include <stdlib.h>
#include <stdio.h>
#include "drawing.h"

void draw_cube_20mm(){
	FILE *arquivo;
	arquivo = fopen("cube.stl","w");
	begin_draw(arquivo);
    //if puts height = 1, will draw a cube with 0.1 x 0.1 x 0.1
	//draw_rectangle(arquivo,0,0,0,200);
    //drawing a cube 2 cm x 2 cm x 2 cm with rectangle 
    int iteratorY;
    int iteratorX;
    int drawY = 0;
    int drawX = 0;
    for(iteratorY = 0; iteratorY < 2; iteratorY++){
        for(iteratorX = 0; iteratorX < 2; iteratorX++){
            draw_rectangle(arquivo, drawX, drawY, 0, 1.5, 10);
            drawX = drawX + 1.000000*1000;
        }
        drawX = 0;
       drawY = drawY + 1.000000*1000;
    } 
    //draw_rectangle(arquivo, drawX, drawY, 0, 1, 20000);   
	//draw_cube(arquivo,0.5,0.5,0,0.5);
	//draw_cube(arquivo,-0.5,0.5,0,0.5);
	//draw_cube(arquivo,-0.5,-0.5,0,0.5);
	//draw_cube(arquivo,0.5,-0.5,0,0.5);
	//draw_cube(arquivo,2,0,0,0.5);
	//recursive_draw(arquivo,10, 1);
	end_draw(arquivo);
	fclose(arquivo);
}

void draw_signal_sum(){
	int width = 5; //20 mm or 2 cm; 10 = 1 mm; 1 = 0.1 mm with 0.1 mm resolution
	int roof = 3;
    int ground = 0.5;
	int band = width * 20/100;
	int limit_less = (width - band)/2;
	int limit_upper = width - limit_less;
	FILE *arquivo;
	arquivo = fopen("signal_sum.stl","w");
	begin_draw(arquivo);
    int iteratorY;
    int iteratorX;
    int drawY = 0;
    int drawX = 0;
    for(iteratorY = 0; iteratorY < width; iteratorY++){
        for(iteratorX = 0; iteratorX < width; iteratorX++){
        	if (iteratorX >= limit_less && iteratorX < limit_upper || iteratorY >= limit_less && iteratorY < limit_upper){
        		draw_rectangle(arquivo, drawX, drawY, 0, roof, 10);
        	}
        	else{
        		draw_rectangle(arquivo, drawX, drawY, 0, ground, 10);
        	}
            drawX = drawX + 1.000000*1000;
        }
        drawX = 0;
       drawY = drawY + 1.000000*1000;
    } 

	end_draw(arquivo);
	fclose(arquivo);
}

void draw_figure_5x5_cm(int matrix_figure[5][5]){
    

}

int main(){
	draw_cube_20mm();
	draw_signal_sum();	


	return 0;
}

/*255 - 3
  x   - y
255y = 3x
y = (3/255)x*/
