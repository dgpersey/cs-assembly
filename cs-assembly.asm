; CS-Assembly

jmp main

;-------------------------;
;        VARIAVEIS        ;
;-------------------------;

; ------------- PLAYER ----------------;
; Variaveis para controle de posicao do player
posPlayer : var #1 ; Posicao do player com relacao ao mapa de tiles
posPlayerAnt : var #1 ; Posicao anterior do player nos tiles
; Variaveis para controle de direcao do player
; UP = 0, RIGHT = 4, DOWN = 8, LEFT = 12
dirPlayer : var #1 		; Direcao atual do player
dirPlayerAnt : var #1 	; Direcao anterior do player
corPlayer : var #1
	static corPlayer + #0, #10240 ; roxo (simulando o azul do CT)
vidaPlayer : var #1
; -------------- TIRO DO PLAYER ------------------;
; Variaveis para controle de posicao do tiro do player
posTiro1 : var #1 	; Posicao do tiro com relacao aos tiles
; Direcao do tiro
dirTiro1 : var #1 ; UP = 0, RIGHT = 4, DOWN = 8, LEFT = 12, NULL = 1
; -------------------------------------------------;

; ------------- BOT -----------------;
; Variaveis para controle de posicao o bot
posBot : var #1 			; Posicao do bot com realacao ao mapa de tiles
posBotAnt : var #1 		; Posicao anterior do bot nos tiles
; Variaveis para controle de direcao do bot
; UP = 0, RIGHT = 4, DOWN = 8, LEFT = 12
dirBot : var #1 		; Direcao atual do bot
dirBotAnt : var #1 	; Direcao anterior do bot
corBot : var #1
	static corBot + #0, #2560 ; laranja (simulando a cor do TR)
vidaBot : var #1
; -------------- TIRO DO BOT ------------------;
; Variaveis para controle de posicao do tiro do bot
posTiro2 : var #1 	; Posicao do tiro com relacao aos tiles
; Direcao do tiro
dirTiro2 : var #1 ; UP = 0, RIGHT = 4, DOWN = 8, LEFT = 12, NULL = 1
; -------------------------------------------------;

; -> CARACTERES DE BONECO.
bonecoChars: string "abcdefghijklmnop"

; -> CARACTERES DE TIRO.
tiroChars: string "$%  &'  $(  )'"

; -> TABELA DE NUMEROS RANDOMICOS
IncRand: var #1			; Incremento para circular pela tabela
Rand : var #100			; 100 numeros randomicos entre 1-10
	static Rand + #0, #1
	static Rand + #1, #4  
	static Rand + #2, #7  
	static Rand + #3, #8  
	static Rand + #4, #4  
	static Rand + #5, #2  
	static Rand + #6, #4  
	static Rand + #7, #6  
	static Rand + #8, #6  
	static Rand + #9, #3  
	static Rand + #10, #7 
	static Rand + #11, #5 
	static Rand + #12, #8 
	static Rand + #13, #4 
	static Rand + #14, #7 
	static Rand + #15, #2 
	static Rand + #16, #5 
	static Rand + #17, #3 
	static Rand + #18, #5 
	static Rand + #19, #2 
	static Rand + #20, #10
	static Rand + #21, #7 
	static Rand + #22, #1 
	static Rand + #23, #7 
	static Rand + #24, #10
	static Rand + #25, #8 
	static Rand + #26, #1 
	static Rand + #27, #9 
	static Rand + #28, #10
	static Rand + #29, #9 
	static Rand + #30, #5
	static Rand + #31, #7
	static Rand + #32, #1
	static Rand + #33, #1
	static Rand + #34, #4
	static Rand + #35, #3
	static Rand + #36, #6
	static Rand + #37, #3
	static Rand + #38, #7
	static Rand + #39, #2
	static Rand + #40, #10
	static Rand + #41, #6
	static Rand + #42, #8
	static Rand + #43, #4
	static Rand + #44, #5
	static Rand + #45, #9
	static Rand + #46, #8
	static Rand + #47, #5
	static Rand + #48, #6
	static Rand + #49, #5
	static Rand + #50, #9
	static Rand + #51, #2
	static Rand + #52, #7
	static Rand + #53, #1
	static Rand + #54, #5
	static Rand + #55, #1
	static Rand + #56, #5
	static Rand + #57, #9
	static Rand + #58, #3
	static Rand + #59, #2
	static Rand + #60, #5
	static Rand + #61, #6
	static Rand + #62, #1
	static Rand + #63, #10
	static Rand + #64, #2
	static Rand + #65, #4
	static Rand + #66, #2
	static Rand + #67, #5
	static Rand + #68, #1
	static Rand + #69, #4
	static Rand + #70, #7
	static Rand + #71, #3
	static Rand + #72, #10
	static Rand + #73, #10
	static Rand + #74, #2
	static Rand + #75, #7
	static Rand + #76, #7
	static Rand + #77, #3
	static Rand + #78, #7
	static Rand + #79, #4
	static Rand + #80, #5
	static Rand + #81, #6
	static Rand + #82, #6
	static Rand + #83, #9
	static Rand + #84, #5
	static Rand + #85, #6
	static Rand + #86, #10
	static Rand + #87, #3
	static Rand + #88, #7
	static Rand + #89, #1
	static Rand + #90, #9
	static Rand + #91, #8
	static Rand + #92, #2
	static Rand + #93, #7
	static Rand + #94, #9
	static Rand + #95, #8
	static Rand + #96, #2
	static Rand + #97, #6
	static Rand + #98, #6
	static Rand + #99, #3

; -> TILES
tilesLinha0:  string "#######################################"
tilesLinha1:  string "#######################################"
tilesLinha2:  string "####                                ###"
tilesLinha3:  string "####                                ###"
tilesLinha4:  string "####                                ###"
tilesLinha5:  string "####   ##########################   ###"
tilesLinha6:  string "####   ##########################   ###"
tilesLinha7:  string "####   ##                      ##   ###"
tilesLinha8:  string "####   ##                      ##   ###"
tilesLinha9:  string "####   ##                      ##   ###"
tilesLinha10: string "####   ##                      ##   ###"
tilesLinha11: string "####   ##                      ##   ###"
tilesLinha12: string "####   ##                      ##   ###"
tilesLinha13: string "####   ##                      ##   ###"
tilesLinha14: string "####   ##                      ##   ###"
tilesLinha15: string "####   ##                      ##   ###"
tilesLinha16: string "####   ##                      ##   ###"
tilesLinha17: string "####   ##                      ##   ###"
tilesLinha18: string "####   ##                      ##   ###"
tilesLinha19: string "####   ##                      ##   ###"
tilesLinha20: string "####   ##                      ##   ###"
tilesLinha21: string "####   ##                      ##   ###"
tilesLinha22: string "####   ##                      ##   ###"
tilesLinha23: string "####   ##########################   ###"
tilesLinha24: string "####   ##########################   ###"
tilesLinha25: string "####                                ###"
tilesLinha26: string "####                                ###"
tilesLinha27: string "####                                ###"
tilesLinha28: string "#######################################"
tilesLinha29: string "#######################################"


tilesLinhaStatic0:  string "#######################################"
tilesLinhaStatic1:  string "#######################################"
tilesLinhaStatic2:  string "####                                ###"
tilesLinhaStatic3:  string "####                                ###"
tilesLinhaStatic4:  string "####                                ###"
tilesLinhaStatic5:  string "####   ##########################   ###"
tilesLinhaStatic6:  string "####   ##########################   ###"
tilesLinhaStatic7:  string "####   ##                      ##   ###"
tilesLinhaStatic8:  string "####   ##                      ##   ###"
tilesLinhaStatic9:  string "####   ##                      ##   ###"
tilesLinhaStatic10: string "####   ##                      ##   ###"
tilesLinhaStatic11: string "####   ##                      ##   ###"
tilesLinhaStatic12: string "####   ##                      ##   ###"
tilesLinhaStatic13: string "####   ##                      ##   ###"
tilesLinhaStatic14: string "####   ##                      ##   ###"
tilesLinhaStatic15: string "####   ##                      ##   ###"
tilesLinhaStatic16: string "####   ##                      ##   ###"
tilesLinhaStatic17: string "####   ##                      ##   ###"
tilesLinhaStatic18: string "####   ##                      ##   ###"
tilesLinhaStatic19: string "####   ##                      ##   ###"
tilesLinhaStatic20: string "####   ##                      ##   ###"
tilesLinhaStatic21: string "####   ##                      ##   ###"
tilesLinhaStatic22: string "####   ##                      ##   ###"
tilesLinhaStatic23: string "####   ##########################   ###"
tilesLinhaStatic24: string "####   ##########################   ###"
tilesLinhaStatic25: string "####                                ###"
tilesLinhaStatic26: string "####                                ###"
tilesLinhaStatic27: string "####                                ###"
tilesLinhaStatic28: string "#######################################"
tilesLinhaStatic29: string "#######################################"


csAsmLinha0:  string "                                       "
csAsmLinha1:  string "                                       "
csAsmLinha2:  string "                                       "
csAsmLinha3:  string "                                       "
csAsmLinha4:  string "   ####  ####       ####  ####  #####  "
csAsmLinha5:  string "   #     #          #  #  #     # # #  "
csAsmLinha6:  string "   #     ####  ###  ####  ####  # # #  "
csAsmLinha7:  string "   #        #       #  #     #  #   #  "
csAsmLinha8:  string "   ####  ####       #  #  ####  #   #  "
csAsmLinha9:  string "                                       "
csAsmLinha10: string "                                       "
csAsmLinha11: string "                                       "
csAsmLinha12: string "                                       "
csAsmLinha13: string "                                       "
csAsmLinha14: string "                                       "
csAsmLinha15: string "                                       "
csAsmLinha16: string "                                       "
csAsmLinha17: string "                                       "
csAsmLinha18: string "                                       "
csAsmLinha19: string "                                       "
csAsmLinha20: string "                                       "
csAsmLinha21: string "                                       "
csAsmLinha22: string "                                       "
csAsmLinha23: string "                                       "
csAsmLinha24: string "                                       "
csAsmLinha25: string "                                       "
csAsmLinha26: string "                                       "
csAsmLinha27: string "                                       "
csAsmLinha28: string "                                       "
csAsmLinha29: string "                                       "


telaInicialLinha0:  string "                                       "
telaInicialLinha1:  string "                                       "
telaInicialLinha2:  string "                                       "
telaInicialLinha3:  string "                                       "
telaInicialLinha4:  string "                                       "
telaInicialLinha5:  string "                                       "
telaInicialLinha6:  string "                                       "
telaInicialLinha7:  string "                                       "
telaInicialLinha8:  string "                                       "
telaInicialLinha9:  string "                                       "
telaInicialLinha10: string "                                       "
telaInicialLinha11: string "                                       "
telaInicialLinha12: string "                                       "
telaInicialLinha13: string "                                       "
telaInicialLinha14: string "                                       "
telaInicialLinha15: string "                                       "
telaInicialLinha16: string "                                       "
telaInicialLinha17: string "                                       "
telaInicialLinha18: string "                                       "
telaInicialLinha19: string "      ef      &          )      mn     "
telaInicialLinha20: string "      gh      '          '      op     "
telaInicialLinha21: string "                                       "
telaInicialLinha22: string "                                       "
telaInicialLinha23: string "                                       "
telaInicialLinha24: string "                                       "
telaInicialLinha25: string "                                       "
telaInicialLinha26: string "        PRESS [SPACE] TO START         "
telaInicialLinha27: string "                                       "
telaInicialLinha28: string "                                       "
telaInicialLinha29: string "                                       "


playerGanhouLinha0:  string "                                       "
playerGanhouLinha1:  string "                                       "
playerGanhouLinha2:  string "                                       "
playerGanhouLinha3:  string "                                       "
playerGanhouLinha4:  string "   #### #### #  # #  # #### #### ####  "
playerGanhouLinha5:  string "   #    #  # #  # ## # #### #    #  #  "
playerGanhouLinha6:  string "   #    #  # #  # # ##  ##  #### ####  "
playerGanhouLinha7:  string "   #    #  # #  # #  #  ##  #    ##    "
playerGanhouLinha8:  string "   #### #### #### #  #  ##  #### #  #  "
playerGanhouLinha9:  string "                                       "
playerGanhouLinha10: string "                                       "
playerGanhouLinha11: string "   #### #### #### #### #### #### ####  "
playerGanhouLinha12: string "    ##  #    #  # #  # #  # #  # #     "
playerGanhouLinha13: string "    ##  #### #### #### #  # #### ####  "
playerGanhouLinha14: string "    ##  #    ##   ##   #  # ##      #  "
playerGanhouLinha15: string "    ##  #### #  # #  # #### #  # ####  "
playerGanhouLinha16: string "                                       "
playerGanhouLinha17: string "                                       "
playerGanhouLinha18: string "        ##     ##  ##  ##    ##        "
playerGanhouLinha19: string "        ##     ##  ##  ####  ##        "
playerGanhouLinha20: string "        ##  #  ##  ##  ##  ####        "
playerGanhouLinha21: string "        ##  #  ##  ##  ##    ##        "
playerGanhouLinha22: string "        #########  ##  ##    ##        "
playerGanhouLinha23: string "                                       "
playerGanhouLinha24: string "                                       "
playerGanhouLinha25: string "                                       "
playerGanhouLinha26: string "       PRESS [SPACE] TO RESTART        "
playerGanhouLinha27: string "                                       "
playerGanhouLinha28: string "                                       "
playerGanhouLinha29: string "                                       "

botGanhouLinha0:  string "                                       "
botGanhouLinha1:  string "                                       "
botGanhouLinha2:  string "                                       "
botGanhouLinha3:  string "                                       "
botGanhouLinha4:  string "                                       "
botGanhouLinha5:  string "                                       "
botGanhouLinha6:  string "   #### #### #### #### #### #### ####  "
botGanhouLinha7:  string "    ##  #    #  # #  # #  # #  # #     "
botGanhouLinha8:  string "    ##  #### #### #### #  # #### ####  "
botGanhouLinha9:  string "    ##  #    ##   ##   #  # ##      #  "
botGanhouLinha10: string "    ##  #### #  # #  # #### #  # ####  "
botGanhouLinha11: string "                                       "
botGanhouLinha12: string "                                       "
botGanhouLinha13: string "        ##     ##  ##  ##    ##        "
botGanhouLinha14: string "        ##     ##  ##  ####  ##        "
botGanhouLinha15: string "        ##  #  ##  ##  ##  ####        "
botGanhouLinha16: string "        ##  #  ##  ##  ##    ##        "
botGanhouLinha17: string "        #########  ##  ##    ##        "
botGanhouLinha18: string "                                       "
botGanhouLinha19: string "                                       "
botGanhouLinha20: string "                                       "
botGanhouLinha21: string "                                       "
botGanhouLinha22: string "                                       "
botGanhouLinha23: string "                                       "
botGanhouLinha24: string "                                       "
botGanhouLinha25: string "                                       "
botGanhouLinha26: string "       PRESS [SPACE] TO RESTART        "
botGanhouLinha27: string "                                       "
botGanhouLinha28: string "                                       "
botGanhouLinha29: string "                                       "

;********************************************************;
;                         CODIGO                         ;
;********************************************************;

main:
	; Apaga todos os caracteres da tela	
	call ApagaTela
	
	call ImprimeCsAsm
	
	call ImprimeTelaInicial
	
	loadn r2, #' '
Loop_inicial:
	inchar r1
	cmp r2, r1
	jne Loop_inicial
	
	; Apaga todos os caracteres da tela
	call ApagaTela
	
	; Imprime os tiles
	call ImprimeTiles
	
	; Spawna os bonecos
	call spawnaPlayer
	call spawnaBot
	
	; Loop 1 do jogo
	loadn r0, #0 ; Contador de loops, c = 0
	Loop:
		call MoveBoneco	; Chama rotina de movimento do player

		; Essa parte e usada para timar o movimento e os tiros do bot, ela foi feita dessa forma para o bot se mover "na media" 1.5 vezes a cada 2 loops e atirar 1 vez a cada 5 loops
		loadn r1, #1
		loadn r2, #3
		mod r2, r0, r2 ; r2 = loop counter % r2 (3)
		cmp r2, r1 ; Se loop % 3 = 1 chama
		ceq iaBot ; Chama rotina de movimento do bot
		loadn r1, #0
		loadn r2, #5
		mod r2, r0, r2 ; r2 = loop counter % r2 (5)
		cmp r2, r1 ; Se loop % 5 = 0 chama tambem
		ceq iaBot ; Chama rotina de movimento do bot
		
		; Parte para timar e atirar 1 vez a cada 3 loops
		loadn r1, #1
		loadn r2, #3
		mod r2, r0, r2 ; r2 = loop counter % r2 (3)
		cmp r2, r1 ; Se loop % 3 = 1 chama
		ceq atiraBot ; Chama rotina de tiro do bot
	
		call AtualizaTiro ;  Chama rotina de atualizacao de tiro
	
		call Delay ; Chama delay entre os loops
		inc r0 	; Incrementa loop coounter
		jmp Loop

	halt

    ;========================================================;
;						SPAWN PLAYER
spawnaPlayer:
	push r0
	
	; Posicao inicial do boneco do player com relacao aos tiles = 1054
	loadn r0, #1058
	store posPlayer, r0	
		
	; Direcao inicial do boneco do player = UP = 0
	loadn r0, #0
	store dirPlayer, r0
		
	; Direcao inicial do tiro do player = NULL = 1
	loadn r0, #1
	store dirTiro1, r0
	
	; Vida inicial do tiro do player = 99
	loadn r0, #99
	store vidaPlayer, r0
	
	; Inicia a posicao anterior em um lugar vazio, para nao apagar o mapa
	loadn r0, #84
	store posPlayerAnt, r0
	
	pop r0	
	rts
;					FIM SPAWN PLAYER
;========================================================;

;========================================================;
;						SPAWN BOT
spawnaBot:
	push r0
		
	; Posicao inicial do boneco do bot = 104
	loadn r0, #98
	store posBot, r0
	
	; Direcao inicial do boneco do bot = DOWN = 8
	loadn r0, #8
	store dirBot, r0
	
	; Direcao inicial do tiro do bot = NULL = 1
	loadn r0, #1
	store dirTiro2, r0
	
	; Vida inicial do tiro do bot = 99
	loadn r0, #99
	store vidaBot, r0
	
	; Inicia a posicao anterior em um lugar vazio, para nao apagar o mapa
	loadn r0, #84
	store posPlayerAnt, r0
	
	pop r0	
	rts
;					FIM SPAWN BOT
;========================================================;

;========================================================;
;						APAGA BONECO
; <- r6 = endereco da posicao anterior do boneco
ApagaBoneco:
	; Empilha registradores para nao perder seus valores
	push r0
	push r1
	push r2
	push r6
	
	; r0 recebe a posicao anterior do boneco na tela
	loadi r0, r6
	; r1 recebe ' ' para apagar o boneco
	loadn r1, #' '
	; r2 recebe 39 para ir para a proxima linha de impressao
	loadn r2, #39
	
	; Apaga os quatro caracteres do boneco
	outchar r1, r0 	; Apaga o primeiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	inc r0 			; Vai para o caractere a direita
	outchar r1, r0 	; Apaga o segundo caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	add r0, r0, r2 	; Vai para a proxima linha
	outchar r1, r0	; Apaga o terceiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	inc r0 			; Vai para o caractere a direita
	outchar r1, r0	; Apaga o quarto caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	; Desempilha registradores
	pop r6
	pop r2
	pop r1
	pop r0
	rts	
;					  FIM APAGA BONECO
;========================================================;

;========================================================;
;						ATUALIZA BONECO
; <- r7 = endereco da posicao atual do boneco
; <- r6 = endereco da posicao anterior do boneco
; <- r5 = endereco da direcao atual do boneco
; <- r4 = endereco da direcao anterior do boneco
; <- r3 = cor do boneco
AtualizaBoneco:
	; Empilha registradores para proteger seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	loadi r1, r7 ; r1 = posicao atual do boneco
	loadi r2, r6 ; r2 = posicao anterior do boneco
	cmp r1, r2 ; compara a posicao atual e anterior
	jne atualiza ; se a posicao mudou, atualiza
	
	loadi r1, r5 ; r1 = direcao atual do boneco
	loadi r2, r4 ; r2 = direcao anterior do boneco
	cmp r1, r2 ; compara a direcao atual e anterior
	jne atualiza ; se a direcao mudou, atualiza
	
fim_atualizaBoneco:
	; posicao anterior <= posicao atual
	loadi r1, r7
	storei r6, r1
	
	; direcao anterior <= direcao atual
	loadi r1, r5
	storei r4, r1
	
	
	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0		
	rts
	
atualiza:
	; r0 = posicao do boneco
    loadi r0, r7
    loadn r1, #0
    cmp r0, r1
    jeq botPerdeu
    loadn r1, #0
    cmp r0, r1
    jeq playerPerdeu 

	; r6 <- endereco da posicao anterior do boneco
	call ApagaBoneco
	
	; Define os caracteres que vao ser usados
	loadn r1, #bonecoChars ; carrega o vetor de caracteres em r1
	loadi r2, r5 ; r2 = direcao do boneco
	add r1, r1, r2 ; agora r1 aponta para o primeiro caractere da direcao correta
	
	
	; -- IMPRESSAO DOS CARACTERES --
	
	; -> Primeiro caractere
	loadi r2, r1 	; r2 recebe o caractere apontado pelo ponteiro de caracteres (r1)
	add r2, r2, r3 	; Adiciona a cor
	outchar r2, r0	; Imprime o primeiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	; -> Segundo caractere
	inc r0 			; r0++ ---> posicao de impressao vai para a direita
	inc r1 			; r1++ ---> r1 aponta para o proximo caractere no vetor de caracteres
	loadi r2, r1 	; r2 recebe o caractere apontado pelo ponteiro de caracteres (r1)
	add r2, r2, r3 	; Adiciona a cor
	outchar r2, r0	; Imprime o segundo caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	; -> Terceiro caractere
	loadn r2, #39 	; r2 = auxiliar para descer de linha (40 - 1 porque ja esta no caractere a direita da posicao do boneco)
	add r0, r0, r2 	; r0 += 39 ---> posicao de impressao vai para a proxima linha
	inc r1 			; r1++ ---> r1 aponta para o proximo caractere no vetor de caracteres
	loadi r2, r1 	; r2 recebe o caractere apontado pelo ponteiro de caracteres (r1)
	add r2, r2, r3 	; Adiciona a cor
	outchar r2, r0	; Imprime o terceiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	; -> Quarto caractere
	inc r0 			; r0++ ---> posicao de impressao vai para a direita
	inc r1 			; r1++ ---> r1 aponta para o caractere no vetor de caracteres
	loadi r2, r1 	; r2 recebe o caractere apontado pelo ponteiro de caracteres (r1)
	add r2, r2, r3 	; Adiciona a cor
	outchar r2, r0	; Imprime o quarto caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	
	jmp fim_atualizaBoneco
    
;					  FIM ATUALIZA BONECO
;========================================================;

;========================================================;
;						MOVE BONECO
MoveBoneco:
	; Empilha registradores para proteger seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	; Pega o input do player
	inchar r1
	
	; Carrega o endereco de posPlayer em r7
	loadn r7, #posPlayer
	; Carrega o endereco de dirPlayer em r6
	loadn r6, #dirPlayer
	; Carrega o endereco de posTiro1 em r5
	loadn r5, #posTiro1
	; Carrega o endereco de dirTiro1 em r4
	loadn r4, #dirTiro1
	
	load r3, vidaPlayer
	loadn r2, #90
	cmp r3, r2
	cle incrementaVida1
	jle playerMorto
	
	; Atualiza a posicao do player dependendo do input do usuário
	loadn r2, #'w'
	cmp r1, r2
	jeq UP_boneco ; Move UP
	
	loadn r2, #'d'
	cmp r1, r2
	jeq RIGHT_boneco ; Move RIGHT
	
	loadn r2, #'s'
	cmp r1, r2
	jeq DOWN_boneco ; Move DOWN
	
	loadn r2, #'a'
	cmp r1, r2
	jeq LEFT_boneco ; Move LEFT
	
	loadn r2, #'f'
	cmp r1, r2
	ceq Tiro ; Tiro
	jeq continuaBoneco
	
playerMorto:
	load r3, vidaBot
	loadn r2, #90
	cmp r3, r2
	cle incrementaVida2
	jle continuaBoneco

continuaBoneco:

	load r3, vidaPlayer
	loadn r2, #90
	cmp r3, r2
	jle naoAtualizaPlayer
	; Atualiza o player
	loadn r7, #posPlayer
	loadn r6, #posPlayerAnt
	loadn r5, #dirPlayer
	loadn r4, #dirPlayerAnt
	load r3, corPlayer
	call AtualizaBoneco
naoAtualizaPlayer:

	
	load r3, vidaBot
	loadn r2, #90
	cmp r3, r2
	jle naoAtualizaBot
	; Atualiza o bot
	loadn r7, #posBot
	loadn r6, #posBotAnt
	loadn r5, #dirBot
	loadn r4, #dirBotAnt
	load r3, corBot
	call AtualizaBoneco
naoAtualizaBot:

	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0		
	rts
	
incrementaVida1:
	load r3, vidaPlayer
	inc r3
	store vidaPlayer, r3
	loadn r2, #10
	cmp r3, r2
	ceg spawnaPlayer
	rts	
incrementaVida2:
	load r3, vidaBot
	inc r3
	store vidaBot, r3
	loadn r2, #10
	cmp r3, r2
	ceg spawnaBot
	rts
;						FIM MOVE BONECO
;========================================================;

;========================================================;
;						  ATIRA BOT
; <- r7 = endereco da posicao do bot
; <- r6 = endereco da direcao do bot
; <- r5 = endereco da posicao do tiro
; <- r4 = endereco da direcao do tiro  
atiraBot:
	; Empilha registradores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	; Carrega o endereco de posBot em r7
	loadn r7, #posBot
	; Carrega o endereco de dirBot em r6
	loadn r6, #dirBot
	; Carrega o endereco de posTiro2 em r5
	loadn r5, #posTiro2
	; Carrega o endereco de dirTiro2 em r4
	loadn r4, #dirTiro2
    
    

	call Tiro ; Faz o bot atirar

	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0		
	rts
;						FIM ATIRA BOT
;========================================================;

;========================================================;
;						  IA BOT
iaBot:
	; Empilha registradores para proteger seus valores para a funcao da IA de fato
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	; Carrega o endereco de posBot em r7
	loadn r7, #posBot
	; Carrega o endereco de dirBot em r6
	loadn r6, #dirBot

; Switch para obter a localizacao do bot, para depois realizar o movimento com as pesagens apropriadas
 ; Case 0, bot na linha de cima (North) -> Pesos: DIR: 20%, ESQ: 60%, DWN: 10%, UP: 10%
	loadn r2, #200 ; Posicao do mapa do canto inferior direito da linha de cima
	cmp r7, r2	; Compara com a posicao do bot
	jgr iaBot_CaseSouth ; Se for maior do que 200 entao nao esta na linha de cima

	; Switch interno com respectivos pesos
			; sorteia nr. randomico entre 1-10
			loadn r2, #Rand 	; declara ponteiro para tabela rand na memoria!
			load r1, IncRand	; Pega Incremento da tabela Rand
			add r2, r2, r1		; Soma Incremento ao inicio da tabela Rand
								; r2 = Rand + IncRand
			loadi r3, r2 		; busca nr. randomico da memoria em r3
								; r3 = Rand(IncRand)				
			inc r1				; Incremento ++
			loadn r2, #100
			cmp r1, r2			; Compara com o Final da Tabela e re-estarta em 0
			jne iaBot_Skip_West
				loadn r1, #0		; re-estarta a Tabela Rand em 0
		iaBot_Skip_North:
			store IncRand, r1	; Salva incremento ++

		; Switch Rand (r3)
		; Case 0 : Bot move para direita com o respectivo peso
			loadn r2, #2 ; Peso de 20% cumulativo
			cmp r3, r2 ; Se rand maior que 2, proximo caso
			jgr iaBot_Case1_North

			jmp RIGHT_boneco ; Move RIGHT

			jmp iaBot_FimSwitch	; Break do Switch

		; Case 1 : Bot move para esquerda com respectivo peso
		iaBot_Case1_North:
			loadn r2, #8 ; Peso de 60% cumulativo
			cmp r3, r2	; Se rand maior que 8, proximo caso
			jgr iaBot_Case2_North
			
			jmp LEFT_boneco ; Move LEFT
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 2 : Bot move para baixo com respectivo peso
		iaBot_Case2_North:
			loadn r2, #9 ; Peso de 10% cumulativo
			cmp r3, r2 ; Se rand maior que 9, proximo caso
			jgr iaBot_Case3_North
			
			jmp DOWN_boneco ; Move DOWN
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 3 : Bot move para cima com respectivo peso
		iaBot_Case3_North:
			; Peso de 10% cumulativo mas nao importa

			jmp UP_boneco ; Move UP
			
			jmp iaBot_FimSwitch	; Break do Switch

 ; Case 1, bot na linha de baixo (South) -> Pesos: DIR: 60%, ESQ: 20%, DWN: 10%, UP: 10%
   iaBot_CaseSouth:
    loadn r2, #1001 ; Posicao do canto superior esquerdo da linha de baixo
	cmp r7, r2	; Compara com a posicao do bot
	jle iaBot_CaseEast ; Se for menor que 1001 entao nao esta na linha de baixo

	; Switch interno com respectivos pesos
			; sorteia nr. randomico entre 1-10
			loadn r2, #Rand 	; declara ponteiro para tabela rand na memoria!
			load r1, IncRand	; Pega Incremento da tabela Rand
			add r2, r2, r1		; Soma Incremento ao inicio da tabela Rand
								; r2 = Rand + IncRand
			loadi r3, r2 		; busca nr. randomico da memoria em r3
								; r3 = Rand(IncRand)				
			inc r1				; Incremento ++
			loadn r2, #100
			cmp r1, r2			; Compara com o Final da Tabela e re-estarta em 0
			jne iaBot_Skip_West
				loadn r1, #0		; re-estarta a Tabela Rand em 0
		iaBot_Skip_South:
			store IncRand, r1	; Salva incremento ++

		; Switch Rand (r3)
		; Case 0 : Bot move para direita com o respectivo peso
			loadn r2, #6 ; Peso de 60% cumulativo
			cmp r3, r2 ; Se rand maior que 6, proximo caso
			jgr iaBot_Case1_South

			jmp RIGHT_boneco ; Move RIGHT

			jmp iaBot_FimSwitch	; Break do Switch

		; Case 1 : Bot move para esquerda com respectivo peso
		iaBot_Case1_South:
			loadn r2, #8 ; Peso de 20% cumulativo
			cmp r3, r2	; Se rand maior que 8, proximo caso
			jgr iaBot_Case2_South
			
			jmp LEFT_boneco ; Move LEFT
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 2 : Bot move para baixo com respectivo peso
		iaBot_Case2_South:
			loadn r2, #9 ; Peso de 10% cumulativo
			cmp r3, r2 ; Se rand maior que 9, proximo caso
			jgr iaBot_Case3_South
			
			jmp DOWN_boneco ; Move DOWN
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 3 : Bot move para cima com respectivo peso
		iaBot_Case3_South:
			; Peso de 10% cumulativo mas nao importa

			jmp UP_boneco ; Move UP
			
			jmp iaBot_FimSwitch	; Break do Switch

 ; Case 2, bot na coluna da direita (East) -> Pesos: DIR: 10%, ESQ: 10%, DWN: 60%, UP: 20%
   iaBot_CaseEast:
    loadn r2, #40 ; Auxiliar para fazer o modulo
	mod r3, r7, r2 ; r3 = posBot (r7) % 40

	; Primeiro checa a coluna central
	loadn r1, #35 ; Auxiliar com a coluna central da coluna da direita do mapa
	cmp r3, r1
	jeq iaBot_CaseEast_Continua

	; Agora checa a coluna da esquerda
	loadn r1, #34 ; Auxiliar com a coluna da esquerda da coluna da direita do mapa
	cmp r3, r1
	jeq iaBot_CaseEast_Continua

	; Finalmente checa a coluna da direita
	loadn r1, #36 ; Auxiliar com a coluna da direita da coluna da direita do mapa
	cmp r3, r1
	jeq iaBot_CaseEast_Continua

	; Caso nenhum dos 3 seja igual entao vai para o proximo case no switch
	jmp iaBot_CaseWest

   iaBot_CaseEast_Continua:
	; Switch interno com respectivos pesos
			; sorteia nr. randomico entre 1-10
			loadn r2, #Rand 	; declara ponteiro para tabela rand na memoria!
			load r1, IncRand	; Pega Incremento da tabela Rand
			add r2, r2, r1		; Soma Incremento ao inicio da tabela Rand
								; r2 = Rand + IncRand
			loadi r3, r2 		; busca nr. randomico da memoria em r3
								; r3 = Rand(IncRand)				
			inc r1				; Incremento ++
			loadn r2, #100
			cmp r1, r2			; Compara com o Final da Tabela e re-estarta em 0
			jne iaBot_Skip_West
				loadn r1, #0		; re-estarta a Tabela Rand em 0
		iaBot_Skip_East:
			store IncRand, r1	; Salva incremento ++

		; Switch Rand (r3)
		; Case 0 : Bot move para direita com o respectivo peso
			loadn r2, #1 ; Peso de 10% cumulativo
			cmp r3, r2 ; Se rand maior que 1, proximo caso
			jgr iaBot_Case1_East

			jmp RIGHT_boneco ; Move RIGHT

			jmp iaBot_FimSwitch	; Break do Switch

		; Case 1 : Bot move para esquerda com respectivo peso
		iaBot_Case1_East:
			loadn r2, #2 ; Peso de 10% cumulativo
			cmp r3, r2	; Se rand maior que 2, proximo caso
			jgr iaBot_Case2_East
			
			jmp LEFT_boneco ; Move LEFT
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 2 : Bot move para baixo com respectivo peso
		iaBot_Case2_East:
			loadn r2, #8 ; Peso de 60% cumulativo
			cmp r3, r2 ; Se rand maior que 8, proximo caso
			jgr iaBot_Case3_East
			
			jmp DOWN_boneco ; Move DOWN
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 3 : Bot move para cima com respectivo peso
		iaBot_Case3_East:
			; Peso de 20% cumulativo mas nao importa

			jmp UP_boneco ; Move UP
			
			jmp iaBot_FimSwitch	; Break do Switch

 ; Case 3, bot na coluna da esquerda (West) -> Pesos: DIR: 10%, ESQ: 10%, DWN: 50%, UP: 30%
   iaBot_CaseWest:
    loadn r2, #40 ; Auxiliar para fazer o modulo
	mod r3, r7, r2 ; r3 = posBot (r7) % 40

	; Primeiro checa a coluna central
	loadn r1, #6 ; Auxiliar com a coluna central da coluna da esquerda do mapa
	cmp r3, r1
	jeq iaBot_CaseWest_Continua

	; Agora checa a coluna da esquerda
	loadn r1, #5 ; Auxiliar com a coluna da esquerda da coluna da esquerda do mapa
	cmp r3, r1
	jeq iaBot_CaseWest_Continua

	; Finalmente checa a coluna da direita
	loadn r1, #7 ; Auxiliar com a coluna da direita da coluna da esquerda do mapa
	cmp r3, r1
	jeq iaBot_CaseWest_Continua

	; Caso nenhum dos 3 seja igual entao vai para o proximo case no switch (no caso aqui e o fim do switch)
	jmp iaBot_FimSwitch

   iaBot_CaseWest_Continua:
	; Switch interno com respectivos pesos
			; sorteia nr. randomico entre 1-10
			loadn r2, #Rand 	; declara ponteiro para tabela rand na memoria!
			load r1, IncRand	; Pega Incremento da tabela Rand
			add r2, r2, r1		; Soma Incremento ao inicio da tabela Rand
								; r2 = Rand + IncRand
			loadi r3, r2 		; busca nr. randomico da memoria em r3
								; r3 = Rand(IncRand)				
			inc r1				; Incremento ++
			loadn r2, #100
			cmp r1, r2			; Compara com o Final da Tabela e re-estarta em 0
			jne iaBot_Skip_West
				loadn r1, #0		; re-estarta a Tabela Rand em 0
		iaBot_Skip_West:
			store IncRand, r1	; Salva incremento ++

		; Switch Rand (r3)
		; Case 0 : Bot move para direita com o respectivo peso
			loadn r2, #1 ; Peso de 10% cumulativo
			cmp r3, r2 ; Se rand maior que 1, proximo caso
			jgr iaBot_Case1_West

			jmp RIGHT_boneco ; Move RIGHT

			jmp iaBot_FimSwitch	; Break do Switch

		; Case 1 : Bot move para esquerda com respectivo peso
		iaBot_Case1_West:
			loadn r2, #2 ; Peso de 10% cumulativo
			cmp r3, r2	; Se rand maior que 2, proximo caso
			jgr iaBot_Case2_West
			
			jmp LEFT_boneco ; Move LEFT
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 2 : Bot move para baixo com respectivo peso
		iaBot_Case2_West:
			loadn r2, #7 ; Peso de 50% cumulativo
			cmp r3, r2 ; Se rand maior que 7, proximo caso
			jgr iaBot_Case3_West
			
			jmp DOWN_boneco ; Move DOWN
			
			jmp iaBot_FimSwitch	; Break do Switch

		; Case 3 : Bot move para cima com respectivo peso
		iaBot_Case3_West:
			; Peso de 30% cumulativo mas nao importa

			jmp UP_boneco ; Move UP
			
			jmp iaBot_FimSwitch	; Break do Switch

	; jmp iaBot_FimSwitch	; Break do Switch


 ; Fim Switch:
  iaBot_FimSwitch:	
	store posBot, r0	; Grava a posicao alterada na memoria
	call continuaBoneco ; Call funcao para continuar calculo do boneco

	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0		
	rts
;						FIM IA BOT
;========================================================;

;-------------------------------------------------------;
;                         UP BONECO
; Move um boneco para cima
; <- r7 = endereco da posicao do boneco
; <- r6 = endereco da direcao do boneco
UP_boneco:
	; Carrega a posicao do boneco em r0
	loadi r0, r7
	
	; Atualiza a direcao
	loadn r1, #0
	storei r6, r1 ; dirBoneco = UP = 0
	
	; -- ATUALIZA POSICAO ATUAL EM r0 --
	loadn r1, #84 		; r1 = auxiliar para verificar se chegou na primeira linha
	loadn r2, #40 		; r2 = auxiliar para subir linha
	; r0 JA TEM A POSICAO DO BONECO !!!
	sub r0, r0, r2 		; pos = pos - 40 ---> sobe uma linha
	cmp r0, r1 			; Verifica se ja esta na primeira linha
	jle continuaBoneco 	; Se ja estiver na primeira linha nao movimeta
	
	; -- VERIFICACAO SE A POSICAO QUE QUER IR EH UM TILE --
	loadn r1, #'#' 				; r1 = '#'  ---> auxiliar para comparar a nova posicao com um tile
	loadn r4, #tilesLinha0 	; r4 = ponteiro para o primeiro caractere do mapa de tiles
	add r4, r4, r0 				; r4 = r4 + posBoneco ---> ponteiro para o caractere do mapa de tiles na posicao que o boneco quer ir
	loadi r3, r4 				; r3 = caractere do mapa de tiles na posicao que o boneco quer ir
	cmp r1, r3 					; Compara o caractere na posicao que o boneco quer ir com um tile
	jeq continuaBoneco 			; Se for um tile o movimento nao eh realizado
	; TAMBEM EH NECESSARIO VERIFICAR O CARACTERE A DIREITA !!! (O boneco tem dimensoes 2x2)
	inc r4						; Ponteiro para caractere vai um para a direita
	loadi r3, r4 				; r4 = caractere na direita da posicao que o boneco quer ir
	cmp r1, r3 					; Compara o caractere a direita da posicao que o boneco quer ir 
	jeq continuaBoneco 			; Se for um tile o movimento nao eh realizado
	
	; -- PASSOU TODOS OS TESTES --
	; r0 ja tem a posicao correta entao atualiza a posicao
	storei r7, r0
	
	jmp continuaBoneco
;-------------------------------------------------------;
;                         RIGHT BONECO
; Move um boneco para a direita
; <- r0 = posicao do boneco
RIGHT_boneco:
	; Carrega a posicao do boneco em r0
	loadi r0, r7
	
	; Atualiza a direcao
	loadn r1, #4
	storei r6, r1 ; dirBoneco = RIGHT = 4
	
	; -- ATUALIZA POSICAO ATUAL EM r0 --
	loadn r1, #34 				; r1 = auxiliar para verificar se esta na ultima coluna
	loadn r2, #40 				; r2 = auxiliar para fazer mod
	; r0 JA TEM A POSICAO DO BONECO COM RELACAO AOS TILES !!!
	inc r0 						; r0++ ---> Posicao vai um pra direita
	mod r3, r0, r2 				; r3 = pos % 40 ---> r3 = coluna
	cmp r3, r1 					; Verifica se ja esta na ultima coluna (coluna 34 por causa da margem)
	jgr continuaBoneco 			; Se ja estiver na ultima coluna nao movimeta
	
	; -- VERIFICACAO SE A POSICAO QUE QUER IR EH UM TILE --
	loadn r1, #'#'				; r1 = '#'  ---> auxiliar para comparar o caractere a direita da nova posicao com um tile
	loadn r4, #tilesLinha0 	; r4 = ponteiro para o primeiro caractere do mapa de tiles
	add r4, r4, r0 				; r4 = r4 + posBoneco ---> ponteiro para o caractere do mapa de tiles na posicao que o boneco quer ir
	inc r4 						; r4++ ---> r4 vai um pra direita porque o boneco eh (2x2)
	loadi r3, r4 				; r3 = caractere do mapa de tiles apontado por r4
	cmp r1, r3 					; Compara o caractere na posicao a direita que o boneco quer ir com um tile
	jeq continuaBoneco 			; Se for um tile movimento nao eh realizado
	; TAMBEM EH NECESSARIO VERIFICAR O CARACTERE ABAIXO!!! (O boneco tem dimensoes 2x2)
	add r4, r4, r2				; r4 = r4 + 40 ---> ponteiro para caractere desce uma linha
	loadi r3, r4 				; r3 = caractere do mapa de tiles apontado por r4
	cmp r1, r3 					; Compara o caractere a direita e abaixo da posicao que o boneco quer ir com um tile
	jeq continuaBoneco 			; Se for um tile o movimento nao eh realizado
	
	; -- PASSOU TODOS OS TESTES --
	; r0 ja tem a posicao correta entao atualiza a posicao
	storei r7, r0
	
	jmp continuaBoneco
;-------------------------------------------------------;
;                         DOWN BONECO
; Move um boneco para a baixo
; <- r0 = posicao do boneco
DOWN_boneco:
	; Carrega a posicao do boneco em r0
	loadi r0, r7
	
	; Atualiza a direcao
	loadn r1, #8
	storei r6, r1 ; dirBoneco = DOWN = 8
	
	; -- ATUALIZA POSICAO ATUAL EM r0 --
	loadn r1, #1076		; r1 = auxiliar para verificar se chegou na ultima linha
	loadn r2, #40 		; r2 = auxiliar para descer linha no mapa de tiles
	; r0 JA TEM A POSICAO DO BONECO COM RELACAO AOS TILES !!!
	add r0, r0, r2 		; pos = pos + 40 ---> desce uma linha no mapa de tiles
	cmp r0, r1 			; Verifica se ja esta na ultima linha
	jgr continuaBoneco 	; Se ja estiver na ultima linha nao movimeta
	
	; -- VERIFICACAO SE A POSICAO QUE QUER IR EH UM TILE --
	loadn r1, #'#' 				; r1 = '#'  ---> auxiliar para comparar o caractere abaixo da nova posicao com um tile
	loadn r4, #tilesLinha0 	; r4 = ponteiro para o primeiro caractere do mapa de tiles
	add r4, r4, r0 				; r4 = r4 + posBoneco ---> ponteiro para o caractere do mapa de tiles na posicao que o boneco quer ir
	add r4, r4, r2 				; r4 = r4 + 40 ---> ponteiro desce mais um porque o boneco eh 2x2
	loadi r3, r4				; r3 = caractere do mapa de tiles na posicao abaixo da que o boneco quer ir
	cmp r1, r3 					; Compara o caractere na posicao abaixo da que o boneco quer ir com um tile
	jeq continuaBoneco 			; Se for um tile o movimento nao eh realizado
	; TAMBEM EH NECESSARIO VERIFICAR O CARACTERE A DIREITA !!! (O boneco tem dimensoes 2x2)
	inc r4						; Ponteiro para caractere vai um para a direita
	loadi r3, r4 				; r3 = caractere na direita e abaixo da posicao que o boneco quer ir
	cmp r1, r3 					; Compara o caractere a direita e abaixo da posicao que o boneco quer ir com um tile
	jeq continuaBoneco 			; Se for um tile o movimento nao eh realizado
	
	; -- PASSOU TODOS OS TESTES --
	; r0 ja tem a posicao correta entao atualiza a posicao
	storei r7, r0
	
	jmp continuaBoneco
;-------------------------------------------------------;
;                         LEFT BONECO
; Move um boneco para a direita
; <- r0 = posicao do boneco
LEFT_boneco:	
	; Carrega a posicao do boneco em r0
	loadi r0, r7
	
	; Atualiza a direcao
	loadn r1, #12
	storei r6, r1 ; dirBoneco = LEFT = 12
	
	; -- ATUALIZA POSICAO ATUAL EM r0 --
	loadn r1, #4 				; r1 = auxiliar para verificar se esta na primeira coluna
	loadn r2, #40 				; r2 = auxiliar para fazer mod
	; r0 JA TEM A POSICAO DO BONECO COM RELACAO AOS TILES !!!
	dec r0 						; r0-- ---> Posicao vai um pra esquerda
	mod r3, r0, r2 				; r3 = pos % 40 ---> r3 = coluna
	cmp r3, r1 					; Verifica se ja esta na primeira coluna (coluna 4 por causa da margem)
	jle continuaBoneco 			; Se ja estiver na primeira coluna nao movimeta
	
	; -- VERIFICACAO SE A POSICAO QUE QUER IR EH UM TILE --
	loadn r1, #'#'				; r1 = '#'  ---> auxiliar para comparar o caractere da nova posicao com um tile
	loadn r4, #tilesLinha0 	; r4 = ponteiro para o primeiro caractere do mapa de tiles
	add r4, r4, r0 				; r4 = r4 + posBoneco ---> ponteiro para o caractere do mapa de tiles na posicao que o boneco quer ir
	loadi r3, r4 				; r3 = caractere do mapa de tiles apontado por r4
	cmp r1, r3 					; Compara o caractere na posicao que o boneco quer ir com um tile
	jeq continuaBoneco 			; Se for um tile movimento nao eh realizado
	; TAMBEM EH NECESSARIO VERIFICAR O CARACTERE ABAIXO!!! (O boneco tem dimensoes 2x2)
	add r4, r4, r2				; r4 = r4 + 40 ---> ponteiro para caractere desce uma linha
	loadi r3, r4 				; r3 = caractere abaixo da posicao que o boneco quer ir
	cmp r1, r3 					; Compara o caractere a abaixo da posicao que o boneco quer ir com um tile
	jeq continuaBoneco 			; Se for um tile o movimento nao eh realizado
	
	; -- PASSOU TODOS OS TESTES --
	; r0 ja tem a posicao correta entao atualiza a posicao
	storei r7, r0
	
	jmp continuaBoneco
;		     	FIM UP_RIGHT_DOWN_LEFT BONECO
;-------------------------------------------------------;

;========================================================;
;                         TIRO
; <- r7 = endereco da posicao do boneco 
; <- r6 = endereco da direcao do boneco
; <- r5 = endereco da posicao do tiro
; <- r4 = endereco da direcao do tiro    
Tiro:
	; Empilha registradores para preservar seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	; Compara a direcao atual do tiro com NULO se nao for nulo, ja existe o tiro, portanto nao cria outro
	loadn r0, #1
	loadi r1, r4
	cmp r1, r0
	jne naoAtira
	
	loadi r0, r7 ; r0 = posicao do boneco
	loadi r1, r6 ; r1 = direcao do boneco
	; Atualiza direcao do tiro para direcao do boneco
	storei r4, r1 ; dirTiro = dirBoneco
	
	loadn r2, #0
	cmp r1, r2
	jne not_tiro_UP
	loadn r2, #40
	sub r0, r0, r2 ; r0 = posicao do boneco - 40 (posicao do tiro)
	loadn r2, #84
	cmp r0, r2
	jle not_tiro_LEFT
	jmp fimTiro	
not_tiro_UP:
	loadn r2, #4
	cmp r1, r2
	jne not_tiro_RIGHT
	inc r0
	inc r0
	loadn r2, #35
	loadn r3, #40
	mod r3, r0, r3
	cmp r3, r2
	jgr not_tiro_LEFT	
	jmp fimTiro
not_tiro_RIGHT:
	loadn r2, #8
	cmp r1, r2
	jne not_tiro_DOWN
	loadn r2, #80
	add r0, r0, r2 ; r0 = posicao do boneco + 80 (posicao do tiro)
	loadn r2, #1116
	cmp r0, r2
	jgr not_tiro_LEFT
	jmp fimTiro	
not_tiro_DOWN:
	loadn r2, #12
	cmp r1, r2
	jne not_tiro_LEFT
	dec r0
	loadn r2, #4
	loadn r3, #40
	mod r3, r0, r3
	cmp r3, r2
	jle not_tiro_LEFT	
	jmp fimTiro
not_tiro_LEFT:

	; Se chegar nesse ponto algo de errado aconteceu, logo dirTiro = 1 = nulo
	loadn r1, #1
	storei r4, r1 ; dirTiro = NULO
	
fimTiro:
	storei r5, r0 ; Guarda a posicao atualizada do tiro
	
naoAtira:
	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;                       FIM TIRO 
;========================================================;

;========================================================;
;						APAGA TIRO
; <- r7 = endereco da posicao do tiro
; <- r6 = endereco da direcao do tiro
ApagaTiro:
	push r0
	push r1
	push r2
	
	; r0 = direcao do tiro
	loadi r0, r6
	; r1 = posicao do tiro
	loadi r1, r7
	
	; -> Verificacao do sentido do tiro
	loadn r2, #8				; Auxiliar para verificar o sentido do tiro
	mod r2, r0, r2 				; r2 = dirTiro % 8
	jz apagaTiroHorizontal		; Se dirTiro eh multiplo de 8 (UP ou DOWN) apaga o tiro no sentido horizontal
	
	; -> Apaga tiro na vertical
	; r1 JA TEM A POSICAO DO TIRO NA TELA
	loadn r0, #' ' 		; r0 = ' ' para apagar o tiro
	outchar r0, r1 		; Apaga o primeiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	loadn r3, #tilesLinha0
	add r3, r3, r1
	loadi r4, r3
	cmp r4, r0
	cne deletaTiro
	
	loadn r2, #40		; r2 = auxiliar para descer a linha
	add r1, r1, r2 		; r1 += 40 ---> posicao de impressao desce uma linha
	outchar r0, r1		; Apaga o segundo caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	add r3, r3, r2
	loadi r4, r3
	cmp r4, r0
	cne deletaTiro
	
	jmp fim_apagaTiro
	
	; -> Apaga tiro na vertical
apagaTiroHorizontal:
	; r1 JA TEM A POSICAO DO TIRO NA TELA
	loadn r0, #' ' 		; r0 = ' ' para apagar o tiro
	outchar r0, r1 		; Apaga o primeiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	loadn r3, #tilesLinha0
	add r3, r3, r1
	loadi r4, r3
	cmp r4, r0
	cne deletaTiro
	
	inc r1				; r1++ ---> posicao de impressao vai para a direita
	outchar r0, r1		; Apaga o segundo caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	
	inc r3
	loadi r4, r3
	cmp r4, r0
	cne deletaTiro
	
fim_apagaTiro:
	; desempilha registradores
	pop r2
	pop r1
	pop r0
	rts

deletaTiro:
	loadn r1, #1
	storei r6, r1
;					  FIM APAGA TIRO
;========================================================;

;========================================================;
;						IMPRIME TIRO
; <- r7 = endereco da posicao do tiro
; <- r6 = endereco da direcao do tiro
ImprimeTiro:
	push r0
	push r1
	push r2
	push r3
	
	; r0 = direcao do tiro
	loadi r0, r6
	; r1 = posicao do tiro
	loadi r1, r7
	; r3 = ponteiro para os caracteres de tiro
	loadn r3, #tiroChars
	
	; -> Verificacao do sentido do tiro
	loadn r2, #8				; Auxiliar para verificar o sentido do tiro
	mod r2, r0, r2 				; r2 = dirTiro % 8
	jz imprimeTiroHorizontal		; Se dirTiro eh multiplo de 8 (UP ou DOWN) apaga o tiro no sentido horizontal
	
	; -> Apaga tiro na vertical
	; r1 JA TEM A POSICAO DO TIRO NA TELA
	add r3, r3, r0		; r3 = ponteiro para o primeiro caractere da direcao certa
	loadi r0, r3 		; r0 = primeiro caractere da direcao certa
	outchar r0, r1 		; imprime o primeiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	mov r0, r1
	loadn r2, #40		; r2 = auxiliar para descer a linha
	add r1, r1, r2 		; r1 += 40 ---> posicao de impressao desce uma linha
	inc r3				; r3 = ponteiro para o segundo caractere da direcao certa
	loadi r0, r3 		; r0 = segundo caractere da direcao certa
	outchar r0, r1		; imprime o segundo caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	mov r0, r1
	jmp fim_imprimeTiro
	
	; -> Apaga tiro na vertical
imprimeTiroHorizontal:
	; r1 JA TEM A POSICAO DO TIRO NA TELA
	add r3, r3, r0		; r3 = ponteiro para o primeiro caractere da direcao certa
	loadi r0, r3 		; r0 = primeiro caractere da direcao certa
	outchar r0, r1 		; imprime o primeiro caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	mov r0, r1
	inc r1  			; r1 ++ 40 ---> posicao de impressao vai um para a direita
	inc r3				; r3 = ponteiro para o segundo caractere da direcao certa
	loadi r0, r3 		; r0 = segundo caractere da direcao certa
	outchar r0, r1		; imprime o segundo caractere
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
	mov r0, r1
	
fim_imprimeTiro:

	; desempilha registradores
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;					  FIM IMPRIME TIRO
;========================================================;

;========================================================;
;					  ATUALIZA TIRO
AtualizaTiro:
	; Empilha registradores para preservar seus valores
	push r0
	push r1
	push r2
	push r5
	push r6
	push r7
	
	load r0, dirTiro1 ; r0 = dirTiro1
	loadn r1, #1
	cmp r0, r1
	jeq tiro1_nao_existe ; se a direcao do tiro for 1 ele nao existe
	
	loadn r7, #posTiro1
	loadn r6, #dirTiro1	
	cmp r6, r1
	cne ApagaTiro ; so chama se nao for nulo

	call ImprimeTiles ; reimprime tiles tanto para evitar a destruicao dos tiles internos quanto para dar um efeito de flickering para o tiro

	load r5, posBot
	
	; -> Verificacao do sentido do tiro
	loadn r2, #8				; Auxiliar para verificar o sentido do tiro
	mod r2, r0, r2 				; r2 = dirTiro % 8
	cz MoveTiroUP_DOWN			; Se dirTiro eh multiplo de 8 (UP ou DOWN) move o tiro verticalmente
	
	loadn r2, #8				; Auxiliar para verificar o sentido do tiro
	mod r2, r0, r2 				; r2 = dirTiro % 8
	cnz MoveTiroRIGHT_LEFT		; Caso contrario move o tiro horizontalmente
	
	call compara_tiros
	
	load r0, dirTiro1 ; r0 = dirTiro1
	loadn r1, #1
	cmp r0, r1
	cne ImprimeTiro ; compara a direcao atualizada com nulo, se nao for nulo imprime o tiro
	
tiro1_nao_existe:
	
	load r0, dirTiro2 ; r0 = dirTiro2
	loadn r1, #1
	cmp r0, r1
	jeq tiro2_nao_existe ; se a direcao do tiro for 1 ele nao existe
	
	loadn r7, #posTiro2
	loadn r6, #dirTiro2	
	cmp r6, r1
	cne ApagaTiro ; so chama se nao for nulo

	call ImprimeTiles ; reimprime tiles tanto para evitar a destruicao dos tiles internos quanto para dar um efeito de flickering para o tiro
	
	load r5, posPlayer
	
	; -> Verificacao do sentido do tiro
	loadn r2, #8				; Auxiliar para verificar o sentido do tiro
	mod r2, r0, r2 				; r2 = dirTiro % 8
	cz MoveTiroUP_DOWN			; Se dirTiro eh multiplo de 8 (UP ou DOWN) move o tiro verticalmente
	
	loadn r2, #8				; Auxiliar para verificar o sentido do tiro
	mod r2, r0, r2 				; r2 = dirTiro % 8
	cnz MoveTiroRIGHT_LEFT		; Caso contrario move o tiro horizontalmente
	
	call compara_tiros
	
	load r0, dirTiro2 ; r0 = dirTiro1
	loadn r1, #1
	cmp r0, r1
	cne ImprimeTiro ; compara a direcao atualizada com nulo, se nao for nulo imprime o tiro
	
tiro2_nao_existe:
	
	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r2
	pop r1
	pop r0	
	rts
;					FIM ATUALIZA TIRO
;========================================================;

;========================================================;
;					 MOVE TIRO UP OU DOWN
; <- r7 = endereco da posicao do tiro
; <- r6 = endereco da direcao do tiro
; <- r5 = posicao do boneco inimigo
MoveTiroUP_DOWN:
	; Empilha registradores para preservar seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	loadi r0, r7 ; r0 = posicao do tiro
	loadi r1, r6 ; r1 = direcao do tiro
	
	loadn r2, #40
	loadn r3, #0
	cmp r1, r3 ; compara a direcao com UP
	jne moveTiroDown
	sub r0, r0, r2 ; posTiro -= 40 ---> sobe uma linha	
	jmp continuaTiroUP_DOWN
moveTiroDown:
	add r0, r0, r2 ; posTiro += 40 ---> desce uma linha
continuaTiroUP_DOWN:

	loadn r1, #84
	cmp r0, r1
	cle acaba_tiro ; se for menor que 84 ja chegou na primeira linha entao o tiro acaba
	jle fim_moveTiroUP_Down
	
	loadn r1, #1118
	cmp r0, r1
	cgr acaba_tiro ; se for maior que 1118 ja chegou na ultima linha entao o tiro acaba
	jgr fim_moveTiroUP_Down

	storei r7, r0 ; Guarda a posicao do tiro atualizada	
	
	cmp r0, r5 				; compara a posicao do tiro com a posicao do boneco inimigo
	ceq acaba_tiro			
	ceq kill				; mata o boneco inimigo	
	
	inc r0
	cmp r0, r5 				; compara a posicao a direita do tiro com a posicao do boneco inimigo
	ceq acaba_tiro			
	ceq kill				; mata o boneco inimigo
	
	dec r0
	dec r0	
	cmp r0, r5 				; compara a posicao a esquerda do tiro com a posicao do boneco inimigo
	ceq acaba_tiro			
	ceq kill				; mata o boneco inimigo
	
fim_moveTiroUP_Down:		
	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0	
	rts

acaba_tiro:
	loadn r2, #1
	storei r6, r2
	rts
;			      FIM MOVE TIRO UP OU DOWN
;========================================================;

;========================================================;
;			      		COMPARA TIROS
compara_tiros:
	; Empilha registradores para preservar seus valores
	push r1
	push r2
	push r6
	push r7
	
	load r1, dirTiro1
	loadn r2, #1
	cmp r1, r2
	jeq nao_comparaTiros
	
	load r1, dirTiro2
	loadn r2, #1
	cmp r1, r2
	jeq nao_comparaTiros
	
	
	load r1, posTiro1
	load r2, posTiro2
	cmp r1, r2
	loadn r7, #posTiro1
	loadn r6, #dirTiro1
	ceq ApagaTiro
	ceq acaba_tiro
	loadn r7, #posTiro2
	loadn r6, #dirTiro2
	ceq ApagaTiro
	ceq acaba_tiro

nao_comparaTiros:
	; Desempilha registradores
	pop r7
	pop r6
	pop r2
	pop r1
	rts
;			      	  FIM COMPARA TIROS
;========================================================;

;========================================================;
;			      			KILL
; <- r5 = posicao do boneco que morreu
kill:

	push r1
	push r2
	push r6
	
	loadn r2, #1
	load r1, posPlayer
	cmp r1, r5
	jne kill_Bot
	
	loadn r6, #posPlayerAnt
	jmp playerPerdeu
	jmp fim_kill
	
kill_Bot:
	loadn r6, #posPlayerAnt
	jmp botPerdeu
	
fim_kill:
	pop r6
	pop r2
	pop r1
	rts

;========================================================;
;					 MOVE TIRO RIGHT OU LEFT
; <- r7 = endereco da posicao do tiro
; <- r6 = endereco da direcao do tiro
; <- r5 = posicao do boneco inimigo
MoveTiroRIGHT_LEFT:
	; Empilha registradores para preservar seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	loadi r0, r7 ; r0 = posicao do tiro
	loadi r1, r6 ; r1 = direcao do tiro
	
	loadn r2, #4
	cmp r1, r2 ; compara a direcao com RIGHT
	jne MoveTiroLeft
	inc r0 	; vai um pra direita	
	jmp continuaTiroRIGHT_LEFT
MoveTiroLeft:
	dec r0 	; vai um pra esquerda
continuaTiroRIGHT_LEFT:

	loadn r1, #4
	loadn r2, #40
	mod r2, r0, r2 ; r2 = pos % 40 -> coluna
	cmp r2, r1
	cle acaba_tiro ; se for menor que 4 ja chegou na primeira coluna entao o tiro acaba
	jle fim_moveTiroRIGHT_LEFT
	
	loadn r1, #35
	cmp r2, r1
	cgr acaba_tiro ; se for maior que 35 ja chegou na ultima coluna entao o tiro acaba
	jgr fim_moveTiroRIGHT_LEFT

	storei r7, r0 ; Guarda a posicao do tiro atualizada	
	
	cmp r0, r5 				; compara a posicao do tiro com a posicao do boneco inimigo
	ceq acaba_tiro			
	ceq kill				; mata o boneco inimigo	
	
	
	loadn r2, #40
	add r0, r0, r2
	cmp r0, r5 				; compara a posicao abaixo do tiro com a posicao do boneco inimigo
	ceq acaba_tiro			
	ceq kill				; mata o boneco inimigo
	
	sub r0, r0, r2
	sub r0, r0, r2
	cmp r0, r5 				; compara a posicao acima do tiro com a posicao do boneco inimigo
	ceq acaba_tiro			
	ceq kill				; mata o boneco inimigo
	
	
fim_moveTiroRIGHT_LEFT:		
	; Desempilha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0	
	rts
;			      FIM MOVE TIRO RIGHT OU LEFT
;========================================================;


playerPerdeu:
	loadn r1, #0
	loadn r2, #20
loop_playerperdeu:
	call Delay
	inc r1
	cmp r1, r2
	jle loop_playerperdeu
	call ApagaTela
	call ImprimeBotGanhou
	call jogar_novamente
	jmp main
botPerdeu:
	loadn r1, #0
	loadn r2, #20
loop_botperdeu:
	call Delay
	inc r1
	cmp r1, r2
	jle loop_botperdeu
	call ApagaTela
	call ImprimePlayerGanhou
	call jogar_novamente
	jmp main
	
jogar_novamente:
	loadn r2, #' '
loop_jogarNovamente:
	inchar r1
	cmp r2, r1
	jne loop_jogarNovamente
	rts

;========================================================;
;                     IMPRIME TILES      
ImprimeTiles:
	; Empilha registradores para preservar seus valores
	push r1
	push r2
	
	; Impressao dos tiles
	loadn r1, #tilesLinhaStatic0
	loadn r2, #256 ; cor = amarelo
	call ImprimeTelaTiles
	
	; Desempilha registradores
	pop r2
	pop r1
	
	rts
;                   FIM IMPRIME TILES      
;========================================================;

;========================================================;
;                     IMPRIME BATTLE CITY      
ImprimeCsAsm:
	; Empilha registradores para preservar seus valores
	push r1
	push r2
	
	; Impressao dos tiles
	loadn r1, #csAsmLinha0
	loadn r2, #256 ; cor = amarelo
	call ImprimeTela
	
	; Desempilha registradores
	pop r2
	pop r1
	
	rts
;                   FIM IMPRIME BATTLE CITY      
;========================================================;
;========================================================;
;                     IMPRIME TELA INICIAL      
ImprimeTelaInicial:
	; Empilha registradores para preservar seus valores
	push r1
	push r2
	
	; Impressao dos tiles
	loadn r1, #telaInicialLinha0
	loadn r2, #0 ; cor = BRANCO
	call ImprimeTela
	
	; Desempilha registradores
	pop r2
	pop r1
	
	rts
;                   FIM IMPRIME TELA INICIAL       
;========================================================;
;========================================================;
;                   IMPRIME TELA VITORIA BOT      
ImprimeBotGanhou:
	; Empilha registradores para preservar seus valores
	push r1
	push r2
	
	; Impressao dos tiles
	loadn r1, #botGanhouLinha0
	loadn r2, #0 ; cor = BRANCO
	call ImprimeTela
	
	; Desempilha registradores
	pop r2
	pop r1
	
	rts
;                 FIM IMPRIME TELA VITORIA BOT       
;========================================================;
;========================================================;
;                  IMPRIME TELA VITORIA PLAYER      
ImprimePlayerGanhou:
	; Empilha registradores para preservar seus valores
	push r1
	push r2
	
	; Impressao dos tiles
	loadn r1, #playerGanhouLinha0
	loadn r2, #0 ; cor = BRANCO
	call ImprimeTela
	
	; Desempilha registradores
	pop r2
	pop r1
	
	rts
;                FIM IMPRIME TELA VITORIA PLAYER       
;========================================================;

	
;========================================================;
;                     IMPRIME TELA      
;
; <- r1 = ponteiro para a primeira linha da tela 
; <- r2 = cor da tela           
ImprimeTela:
	; Empilha registradores para proteger seus valores
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn r3, #40  	; Incremento da posicao da tela!
	loadn r4, #1200 ; Limite da tela!
	
	
loop_imprimeTela:
	call ImprimeLinha
	add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = r0 + 40
	add r1, r1, r3  	; incrementa o ponteiro para o comeco da proxima linha na memoria r1 = r1 + 40
	cmp r0, r4			; Compara r0 com 1200
	jne loop_imprimeTela	; Enquanto r0 < 1200
	
	; Desempilha registradores
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;                   FIM IMPRIME TELA                   
;========================================================;
	
;========================================================;
;                  IMPRIME TELA TILES      
;
; <- r1 = ponteiro para a primeira linha da tela 
; <- r2 = cor da tela           
ImprimeTelaTiles:
	; Empilha registradores para proteger seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r7

	loadn r0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn r3, #40  	; Incremento da posicao da tela!
	loadn r4, #1200 ; Limite da tela!
	loadn r7, #tilesLinha0
	
	
loop_imprimeTelaTiles:
	call ImprimeLinhaTiles
	add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = r0 + 40
	add r1, r1, r3  	; incrementa o ponteiro para o comeco da proxima linha na memoria r1 = r1 + 40
	add r7, r7, r3  	; incrementa o ponteiro para o comeco da proxima linha na memoria r1 = r1 + 40
	cmp r0, r4			; Compara r0 com 1200
	jne loop_imprimeTelaTiles	; Enquanto r0 < 1200
	
	; Desempilha registradores
	pop r7
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;                FIM IMPRIME TELA TILES                   
;========================================================;
	
;========================================================;
;			    IMPRIME LINHA SEM ESPACO           
;     
; Imprime uma string de 39 caracteres e repete o último caractere
;
; <- r0 = Posicao de inicio da impressao
; <- r1 = Endereco da string que sera impressa
; <- r2 = Cor da impressao
ImprimeLinha:
	; Empilha registradores para proteger seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	; Carrega 38 em r4 para condicao de parada
	loadn r4, #38
	; r6 = contador
	loadn r5, #0
	; Carrega ' ' em r6 para saber se imprime o caractere ou nao
	loadn r6, #' '
	
loop_imprimeLinha:

	loadi r3, r1 ; carrega em r3 o valor do caractere apontado por r1
	cmp r3, r6	 ; compara r3 com ' ' se for igual -> não imprime o caractere
	jeq continua_imprimeLinha
	add r3, r2, r3 ; adiciona a cor da linha
	outchar r3, r0 ; imprime o caractere apontado por r1 na posição r0 com a cor r2
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
continua_imprimeLinha:
	; anda com a posicao da impressao
	inc r0
	
	cmp r5, r4 ; compara o contador com 38
	inc r5 ; contador ++
	
	jeq loop_imprimeLinha ; se for o caractere 39 (contador == 38), volta no loop sem andar no vetor
	
	; se nao for o caractere 39, anda no vetor
	inc r1
	
	cmp r5, r4 ; compara o contador com 38
	jel loop_imprimeLinha ; soh volta no loop se for menor ou igual a 38
	
	; Desempliha registradores
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;	          FIM IMPRIME String SEM ESPACO              
;========================================================;

;========================================================;
;			    IMPRIME LINHA SEM ESPACO           
;     
; Imprime uma string de 39 caracteres e repete o último caractere
;
; <- r0 = Posicao de inicio da impressao
; <- r1 = Endereco da string que sera impressa
; <- r2 = Cor da impressao
; <- r7 = Linha dos tiles nao static
ImprimeLinhaTiles:
	; Empilha registradores para proteger seus valores
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	; Carrega 38 em r4 para condicao de parada
	loadn r4, #38
	; r6 = contador
	loadn r5, #0
	; Carrega ' ' em r6 para saber se imprime o caractere ou nao
	loadn r6, #' '
	
loop_imprimeLinhaTiles:

	loadi r3, r1 ; carrega em r3 o valor do caractere apontado por r1
	storei r7, r3
	cmp r3, r6	 ; compara r3 com ' ' se for igual -> não imprime o caractere
	jeq continua_imprimeLinhaTiles
	add r3, r2, r3 ; adiciona a cor da linha
	outchar r3, r0 ; imprime o caractere apontado por r1 na posição r0 com a cor r2
	; nops para nao bugar a impressao (impressoes sucessivas levam a erros na impressao)
	nop
	nop
	nop
	nop
	nop
	nop
continua_imprimeLinhaTiles:
	; anda com a posicao da impressao
	inc r0
	
	cmp r5, r4 ; compara o contador com 38
	inc r5 ; contador ++
	
	jeq loop_imprimeLinhaTiles ; se for o caractere 39 (contador == 38), volta no loop sem andar no vetor
	
	; se nao for o caractere 39, anda no vetor
	inc r1
	inc r7
	
	cmp r5, r4 ; compara o contador com 38
	jel loop_imprimeLinhaTiles ; soh volta no loop se for menor ou igual a 38
	
	; Desempliha registradores
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;	          FIM IMPRIME String SEM ESPACO              
;========================================================;

;========================================================;
;                       APAGA TELA                       
ApagaTela:
	push r0  
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts
;                      FIM APAGA TELA                       
;========================================================;

;========================================================;
;						  DELAY
Delay:
	; Empilha registradores para nao perder seus valores
	push r0
	push r1
	
	loadn r0, #60
loop_delay1:
	loadn r1, #300
loop_delay2:
	dec r1
	jnz loop_delay2
	dec r0
	jnz loop_delay1
	
	pop r1
	pop r0
	rts
;						FIM DELAY
;========================================================;
	