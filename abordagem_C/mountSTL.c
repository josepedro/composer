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
    for(iteratorY = 0; iteratorY < 200; iteratorY++){
        for(iteratorX = 0; iteratorX < 200; iteratorX++){
            draw_rectangle(arquivo, drawX, drawY, 0, 200, 0.1);
            drawX = drawX + 1.000000*10;
        }
        drawX = 0;
       drawY = drawY + 1.000000*10;
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
	int width = 100; //20 mm or 2 cm; 10 = 1 mm; 1 = 0.1 mm with 0.1 mm resolution
	int roof = 100;
    int ground = 50;
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
        		draw_rectangle(arquivo, drawX, drawY, 0, roof, 1);
        	}
        	else{
        		draw_rectangle(arquivo, drawX, drawY, 0, ground, 1);
        	}
            drawX = drawX + 1.000000*100;
        }
        drawX = 0;
       drawY = drawY + 1.000000*100;
    } 

	end_draw(arquivo);
	fclose(arquivo);
}

int main(){
	draw_cube_20mm();
	draw_signal_sum();	


	return 0;
}
