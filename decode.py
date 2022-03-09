import sys

def separar(data):
    return data.split()

def read(): 
    for x in range(6):
        dato = input()
        if x == 4:            
            data = separar(dato)   
    digit = list()
    blacks = list()
    for x in data:
        if x[0] == "c":
            digit.append(int(x[9]))
        
        elif x[0] == "b":
            dupla = list()
            dupla.append(int(x[6]))
            dupla.append(int(x[8]))
            blacks.append(dupla)
    hitori = list()
    hitori.append(digit)
    hitori.append(blacks)
    return hitori

def draw_tab(digit, black):
    i = 0
    j = 0
    aux = 0
    for x in digit:
        for y in black:
            if (y[0] == i) and (y[1] == j):
                aux = 1
                sys.stdout.write("* ")

        if aux == 1:
            aux = 0
        else:
            sys.stdout.write(str(x) + " ")
            
            
        if i >= (pow(len(digit), 0.5)-1):
            i = 0
            j += 1
            sys.stdout.write("\n")
        else: i += 1
    
            
hitori = read()
draw_tab(hitori[0], hitori[1])


