voto = 0
nome_candidatos = {1:"C1", 2:"C2", 3:"C3", 4:"B", 5:"N"}
votos_candidatos = {1:0, 2:0, 3:0, 4:0, 5:0}
while voto != -1:
    for x, y in nome_candidatos.items():
        print(f"[{x}] {y}")
    voto = int(input("Digite o voto: "))
    if voto in votos_candidatos:
        votos_candidatos[voto]+=1

for x, y in votos_candidatos.items():
    print(f"{nome_candidatos[x]}: [{y}]")
