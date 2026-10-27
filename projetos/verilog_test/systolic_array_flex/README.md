# Exemplo de matriz sistolica flexivel

Este exemplo gera os PEs com `generate`, em vez de escrever `P0`, `P1` etc.
Altere `ROWS`, `COLS` e `K_DIM` na instancia para sintetizar outro tamanho de
array. O tamanho fisico continua fixo depois da sintese.

O testbench calcula:

```text
A = [1 2]    B = [5 6]    C = [19 22]
    [3 4]        [7 8]        [43 50]
```

`west_in` tem uma faixa de `DATA_W` bits para cada linha de A; `north_in` tem
uma faixa para cada coluna de B. Para a configuracao 2x2 de 4 bits:

```text
west_in[3:0] = linha 0     west_in[7:4] = linha 1
north_in[3:0] = coluna 0   north_in[7:4] = coluna 1
```

Simule com Icarus Verilog, se estiver instalado:

```bash
iverilog -g2012 -o sim systolic_pe.v systolic_array_flex.v tb_flex_2x2.v
vvp sim
```

O `done` e gerado apos `K_DIM + ROWS + COLS - 2` ciclos e pressupoe que o
fluxo comece imediatamente apos a retirada de `rst`. Um projeto de producao
normalmente adicionaria `start`, `busy` e uma interface de memoria.
