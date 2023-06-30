(defun inicio (out) 
(format out 
	"\\documentclass[a4paper]{report}
\\usepackage{geometry}
\\usepackage{tikz}
\\geometry{left = 1cm, right = 1cm, top = 1cm, bottom = 1cm}
\\pagestyle{empty}~%

% Ilustracao do comando \" retangulo{x}{y}{aresta_a}{aresta_b}{cor}	\"
%
%	          (m, n)_________________________
%			|			|			|			^
%			|			|			|			|
%			|			|			|			|
%			|			|                 (x, y)|			|
%			|-----------|-----------|			|                       a
%			|			|			|			|
%			|			|			|			|
%			|			|			|			|
%			|			|			|			v
%			¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨(w, z)
%
%			<-----------b----------->
%					
%
%			m = x - b/2
%			w = x + b/2
%			n = y + a/2
%			z = y - a/2
%

\\newcommand{\\retangulo}[5]{
	%\\retangulo{x}{y}{aresta_a}{aresta_b}{cor}	
	\\fill[color = #5] (#1 - #4/2, #2 + #3/2) rectangle(#1 + #4/2,#2 - #3/2);
}

\\newcommand{\\retanguloContorno}[5]{
	\\draw[color = #5] (#1 - #4/2, #2 + #3/2) rectangle(#1 + #4/2,#2 - #3/2);
}

\\begin{document}~%~%

	\\begin{tikzpicture}~%~%"
)

)

(defun fim (out)
(format out "	\\end{tikzpicture}~%
\\end{document}"
)
)

(defun armazenar ()
	(setf pixels (make-array (list (* altu larg) 5)))
	(loop for i from 1 to altu do
		(loop for j from 1 to larg do

			(setq (aref pixels (+ (* i (- larg 1)) j) 1 ) (read image))
			(setq (aref pixels (+ (* i (- larg 1)) j) 2 ) (read image))
			(setq (aref pixels (+ (* i (- larg 1)) j) 3 ) (read image))
			(setq (aref pixels (+ (* i (- larg 1)) j) 4 ) i )
			(setq (aref pixels (+ (* i (- larg 1)) j) 5 ) j )

		)
	)
)

(defun teste ()
	(setf tes (make-array (list 2 3)))

	(loop for i from 1 to 3 do
		(loop for j from 1 to 2 do
			(setq (aref tes (let i j)) 0)
		)	
	)

)

(defun normal ()
	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(format out 
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%" 
				red green blue
			)
			(format out
				"		\\fill[color = cor] (~S / 70, 0 - ~S / 70) circle(~S);~%~%"
				j i raio
			)
		)
	)	
)

(defun preencher_circulos ()
	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\fill[color = cor] (~S, ~S) circle(~S);~%~%" 
				coorx coory raio
			)
		)	
	)
)

(defun contorno_circulos ()
	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\draw[color = cor] (~S, ~S) circle(~S);~%~%" 
				coorx coory raio
			)
		)	
	)
)

(defun preencher_elipses ()
	(setq razao_larg (/ larg_pagina larg))
	(setq razao_altu (/ altu_pagina altu))

	(setq raio_larg (/ razao_larg 2))
	(setq raio_altu (/ razao_altu 2))			

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))
			
			(setq coorx (* j razao_larg))
			(setq coory (- 0 (* i razao_altu)))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\fill[color = cor] (~S, ~S) ellipse(~S and ~S);~%~%" 
				coorx coory raio_larg raio_altu
			)
		)	
	)
)

(defun contorno_elipses ()
	(setq razao_larg (/ larg_pagina larg))
	(setq razao_altu (/ altu_pagina altu))

	(setq raio_larg (/ razao_larg 2))
	(setq raio_altu (/ razao_altu 2))			

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))
			
			(setq coorx (* j razao_larg))
			(setq coory (- 0 (* i razao_altu)))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\draw[color = cor] (~S, ~S) ellipse(~S and ~S);~%~%" 
				coorx coory raio_larg raio_altu
			)
		)	
	)
)

(defun preencher_quadrados ()
	(setq aresta (* raio 2))

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\retangulo{~S}{~S}{~S}{~S}{cor}~%"
				;"		\\fill[color = cor] (~S, ~S) \crule(~S);~%~%" 
				coorx coory aresta aresta
			)
		)	
	)
)

(defun contorno_quadrados ()
	(setq aresta (* raio 2))

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\retanguloContorno{~S}{~S}{~S}{~S}{cor}~%"
				;"		\\fill[color = cor] (~S, ~S) \crule(~S);~%~%" 
				coorx coory aresta aresta
			)
		)	
	)
)

(defun preencher_retangulos()
	(setq razao_larg (/ larg_pagina larg))
	(setq razao_altu (/ altu_pagina altu))

	(setq raio_larg (/ razao_larg 1))
	(setq raio_altu (/ razao_altu 1))

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\retangulo{~S}{~S}{~S}{~S}{cor}~%"
				;"		\\fill[color = cor] (~S, ~S) \crule(~S);~%~%" 
				coorx coory raio_altu raio_larg
			)
		)	
	)
)

(defun preencher_retangulos_cinzas_average ()
	(setq razao_larg (/ larg_pagina larg))
	(setq razao_altu (/ altu_pagina altu))

	(setq raio_larg (/ razao_larg 1))
	(setq raio_altu (/ razao_altu 1))

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{gray}{~S};~%"
				(float (/ (+ red green blue) 765))
			)
			(format out
				"		\\retangulo{~S}{~S}{~S}{~S}{cor}~%"
				;"		\\fill[color = cor] (~S, ~S) \crule(~S);~%~%" 
				coorx coory raio_altu raio_larg
			)
		)	
	)
)

(defun preencher_retangulos_cinzas_luminosity ()
	(setq razao_larg (/ larg_pagina larg))
	(setq razao_altu (/ altu_pagina altu))

	(setq raio_larg (/ razao_larg 1))
	(setq raio_altu (/ razao_altu 1))

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (* (read imagem) 0.21))
			(setq green (* (read imagem) 0.72))
			(setq blue (* (read imagem) 0.07))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{gray}{~S};~%"
				(float (/ (+ red green blue) 255))
			)
			(format out
				"		\\retangulo{~S}{~S}{~S}{~S}{cor}~%"
				;"		\\fill[color = cor] (~S, ~S) \crule(~S);~%~%" 
				coorx coory raio_altu raio_larg
			)
		)	
	)
)

(defun preencher_retangulos_negativo()
	(setq razao_larg (/ larg_pagina larg))
	(setq razao_altu (/ altu_pagina altu))

	(setq raio_larg (/ razao_larg 1))
	(setq raio_altu (/ razao_altu 1))

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (- 255 (read imagem)))
			(setq green (- 255 (read imagem)))
			(setq blue (- 255 (read imagem)))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\retangulo{~S}{~S}{~S}{~S}{cor}~%"
				;"		\\fill[color = cor] (~S, ~S) \crule(~S);~%~%" 
				coorx coory raio_altu raio_larg
			)
		)	
	)
)

(defun preencher_simboxo_x ()
	(setq aresta (* raio 2))

	(loop for i from 1 to altu do
		(loop for j from 1 to larg do
			(setq red (read imagem))
			(setq green (read imagem))
			(setq blue (read imagem))

			(setq coorx (* j (/ larg_pagina larg)))
			(setq coory (- 0 (* i (/ altu_pagina altu))))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\node[font=\\tiny,scale=0.5,color=cor] at (~S,~S) {x};~%~%";
				coorx coory
			)
		)	
	)
)

(setq larg_pagina 18)
(setq altu_pagina 27)
(setq raio 0.015)


; Para gerar o negativo da imagem: 
; abre o arquivo 
(setq imagem (open "inovacao.ppm"))
; lê a primeira  linha com os caracteres p3 (magic numbers)
(setq lixo (read-line imagem))
; le a segunda linha com o comentário
(setq coment (read-line imagem))
; le a altura e a largura da imagem
(setq larg (read imagem))
(setq altu (read imagem))
; (write larg)
; (write altu)
;le a cor de valor 255
(setq lixo (read-line imagem))
(setq out (open "inovacao.tex" :direction :output))
(inicio out)
; (normal)
; (preencher_circulos)
; (contorno_circulos)
; (preencher_elipses)
; (preencher_quadrados)
; (contorno_quadrados)
; (preencher_retangulos)
; (preencher_retangulos_cinzas_average)
; (preencher_retangulos_cinzas_luminosity)
; (preencher_retangulos_negativo)
(preencher_simboxo_x)
(fim out)

(close out)
(close imagem)

;(run-shell-command "lualatex inovacao.tex")
;(run-shell-command "evince inovacao.pdf")