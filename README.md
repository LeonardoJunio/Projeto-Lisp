<h1 align="center">Image Converter With Lisp</h1>

<p align="center">Project to convert image to negative and to shapes, such as: rectangles, squares, and so on, using Lisp.</p>

<hr> 

### :hammer_and_wrench: Technologies & Concepts:

* CLisp v2.49 (SBCL v2.1)

<div align="center" style="display: inline_block">
	<img src="https://img.shields.io/static/v1?label=Lisp&message=v2.49&color=3fb68b&style=flat"/>
	<img src="https://img.shields.io/static/v1?label=license&message=MIT&color=green&style=flat"/>
</div>


### :gear: Settings:

* For both projects: 

```bash
docker build -f lisp.Dockerfile -t build-amb ./ && docker run --rm -it --entrypoint bash -v ${PWD}:/app build-amb 

clisp convert.lisp
```

* Obs 1: The command "sbcl --script convert.lisp" can be used instead of "clisp convert.lisp".

* Referring to the project '**small_forms**':
	* Run the following command to generate the PDF (slow process): 
	```bash
lualatex inovacao.tex 
	```

	* Obs 2: Running the dockerfile without root permissions (USER 1000 without being commented out), after the command "lualatex inovacao.tex", it is necessary to press 'enter' in 2 moments (it gets the question symbol '?').

### :warning: Bugs/Improvements:

##

<div align="center">
	<p>Made with :computer: + :heart: by Leonardo Junio</p>
</div>
