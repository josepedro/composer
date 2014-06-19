open('imagemMatlab.jpg');
imagem  = rgb2gray(imagemMatlab);
imagem = im2double(imagem);

matrix_mount = magic(5);
file = fopen('figure.txt', 'w');


for linha = 0:4,
    for coluna = 0:4,
      matrix_mount(linha + 1, coluna + 1) = mean2(imagem((1 + linha*100):(100 + linha*100), (1 + coluna*100):(100 + coluna*100)));
    end
end

maxi = max(max(matrix_mount));
mini = min(min(matrix_mount));
for linha = 0:4,
    for coluna = 0:4,
      valor = matrix_mount(linha + 1, coluna + 1);
      matrix_mount(linha + 1, coluna + 1) = round((valor - mini)/(maxi - mini)*255);
    end
end

for linha = 1:5
	fprintf(file,'%d %d %d %d %d\n', matrix_mount(linha,:));
end
