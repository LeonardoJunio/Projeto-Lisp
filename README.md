<h1 align="center">Converter Imagem Com Lisp</h1>

<p align="center">Projeto para converter imagem para negativo e para formas, como por exemplo: retângulos, quadrados e etc utilizando Lisp
.</p>

<hr> 

### :hammer_and_wrench: Tecnologias e Conceitos:

* Lisp (SBCL 2.1)

<div align="center" style="display: inline_block">
	<img src="https://img.shields.io/static/v1?label=Lisp&message=v2.1&color=87AED7&style=flat"/>
	<img src="https://img.shields.io/static/v1?label=license&message=MIT&color=green&style=flat"/>
</div>


### :gear: Configurações:

* Para ambos os projetos: 

```bash
docker build -f lisp.Dockerfile -t build-amb ./ && docker run --rm -it --entrypoint bash -v ${PWD}:/app build-amb 
sbcl --script convert.lisp
```

* OBS 1: Para os arquivos que são gerados pelos programas, foi colocado um '\_' antes, para que não tenha conflito em futura tentativa.
* OBS 2: Utilizar o comando "clisp convert.lisp" (clisp version 2.49) para o projeto 'to_negative' funciona, entretanto para o segundo projeto ocasiona erro.
* OBS 3: Com o comando sbcl --script convert.lisp, gera um log no terminal, mas foi desconsiderado (até o momento)

* Somente referente ao projeto 'small_forms':

* Rodar o comando (Processo Muito Lento): 
```bash
lualatex inovacao.tex 
```

* OBS 4: Rodando o dockerfile sem permissão se root (USER 1000 sem estar comentado), é necessário após o comando "lualatex inovacao.tex", apertar enter em 2 momentos (fica com o simbolo de interrogação '?'). Caso rode com root, não é necessário.
* OBS 5: No arquivo convert.lisp, as ultimas 2 linhas estão comentadas. A primeira seria para executar 'lualatex' mas aparentemente este comando não é localizado. A segunda não é necessaria, pois iria abrir um pdf, o qual não faz sentido com o docker.

### :warning: Erros/Aprimoramentos:

* Especificar melhor as versões no readme (Por exemplo: v2.45 e não só v2)
* Transferir para inglês o readme(?)
* Tentar descobrir o motivo do erro quando tentar usar "clisp convert.lisp" no projeto 'small_forms'
* Tentar ajustar para que seja possivel rodar o comando "lualatex inovacao.tex" dentro do arquivo 'convert.lisp'
* Verificar se de fato a imagem possui retângulos, quadrados e etc, pois no log (inovacao.log) esta com erro referente a "Missing character"

##

<div align="center">
	<p>Feito com :computer: + :heart: por Leonardo Junio</p>
</div>
