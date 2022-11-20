largura_sala = float(input('Informe a largura da Sala: '))
comprimento_sala = float(input('Informe o comprimento da Sala: ')) 
trajeto_robo = str(input('Informe o trajeto: '))
coordenadas = { 90 : 'O', 180 : 'N', 270 : 'L', 0 : 'S'} # coordenandas da posição do robo
posicao = 180 # Posição inicial
robo1 = 0 
robo2 = 0

for i in range(len(trajeto_robo)):
    # verifica se o i == D então soma mais 90 para rotacionar o robo
    if trajeto_robo[i] == 'D':
        posicao += 90
    if trajeto_robo[i] == 'E':
        posicao -= 90
    if trajeto_robo[i] == 'F':
        if coordenadas[posicao%360] == 'N' and (robo2 + 1) < comprimento_sala:
            robo2 += 1
        if coordenadas[posicao%360] == 'S' and (robo2 - 1) >= 0:
            robo2 -= 1
        if coordenadas[posicao%360] == 'L' and (robo1 + 1) < largura_sala:
            robo1 += 1
        if coordenadas[posicao%360] == 'O' and (robo1 - 1) >= 0:
            robo1 -= 1

    #  se  i == T o robo irá para andar pra trás
    if trajeto_robo[i] == 'T':
        if coordenadas[posicao%360] == 'N' and (robo2 - 1) >= 0:
            robo2 -= 1
        if coordenadas[posicao%360] == 'S' and (robo2 + 1) < comprimento_sala:
            robo2 += 1
        if coordenadas[posicao%360] == 'L' and (robo1 - 1) >= 0:
            robo1 -= 1
        if coordenadas[posicao%360] == 'O' and (robo1 + 1) < largura_sala:
            robo1 += 1
            
print('{} {} {}'.format(coordenadas[posicao%360], robo1, robo2))