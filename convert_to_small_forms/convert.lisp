(defun begin (out) 
	(format out 
	"\\documentclass[a4paper]{report}
\\usepackage{geometry}
\\usepackage{tikz}
\\usepackage{txfonts}
\\geometry{left = 1cm, right = 1cm, top = 1cm, bottom = 1cm}
\\pagestyle{empty}~%

% Command illustration \" rectangle{x}{y}{edge_a}{edge_b}{cor}	\"
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

\\newcommand{\\fillRectangle}[5]{
	%\\fillRectangle{x}{y}{edge_a}{edge_b}{cor}	
	\\fill[color = #5] (#1 - #4/2, #2 + #3/2) rectangle(#1 + #4/2,#2 - #3/2);
}

\\newcommand{\\drawRectangle}[5]{
	\\draw[color = #5] (#1 - #4/2, #2 + #3/2) rectangle(#1 + #4/2,#2 - #3/2);
}

\\begin{document}~%
	\\begin{tikzpicture}~%~%"
	)
)

(defun end (out)
	(format out "	\\end{tikzpicture}~%
\\end{document}"
	)
)

(defun set_color_image ()
	(setq red (read image))
	(setq green (read image))
	(setq blue (read image))
)

(defun set_coordinates (i j width height)
	(setq coordx (* j (/ width_pagina width)))
	(setq coordy (- 0 (* i (/ height_pagina height))))
)

(defun normal ()
	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(format out 
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%" 
				red green blue
			)
			(format out
				"		\\fill[color = cor] (~S / 70, 0 - ~S / 70) circle(~S);~%~%"
				j i radius
			)
		)
	)	
)

(defun fill_circles ()
	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\fill[color = cor] (~S, ~S) circle(~S);~%~%" 
				coordx coordy radius
			)
		)	
	)
)

(defun draw_circles ()
	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\draw[color = cor] (~S, ~S) circle(~S);~%~%" 
				coordx coordy radius
			)
		)	
	)
)

(defun fill_ellipses ()
	(setq ratio_width (/ width_pagina width))
	(setq ratio_height (/ height_pagina height))

	(setq radius_width (/ ratio_width 2))
	(setq radius_height (/ ratio_height 2))			

	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)
			
			(setq coordx (* j ratio_width))
			(setq coordy (- 0 (* i ratio_height)))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\fill[color = cor] (~S, ~S) ellipse(~S and ~S);~%~%" 
				coordx coordy radius_width radius_height
			)
		)	
	)
)

(defun draw_ellipses ()
	(setq ratio_width (/ width_pagina width))
	(setq ratio_height (/ height_pagina height))

	(setq radius_width (/ ratio_width 2))
	(setq radius_height (/ ratio_height 2))			

	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)
			
			(setq coordx (* j ratio_width))
			(setq coordy (- 0 (* i ratio_height)))

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\draw[color = cor] (~S, ~S) ellipse(~S and ~S);~%~%" 
				coordx coordy radius_width radius_height
			)
		)	
	)
)

(defun fill_squares ()
	(setq edge (* radius 2))

	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\fillRectangle{~S}{~S}{~S}{~S}{cor}~%~%"
				coordx coordy edge edge
			)
		)	
	)
)

(defun draw_squares ()
	(setq edge (* radius 2))

	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\drawRectangle{~S}{~S}{~S}{~S}{cor}~%~%"
				coordx coordy edge edge
			)
		)	
	)
)

(defun fill_rectangles()
	(setq ratio_width (/ width_pagina width))
	(setq ratio_height (/ height_pagina height))

	(setq radius_width (/ ratio_width 1))
	(setq radius_height (/ ratio_height 1))

	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\fillRectangle{~S}{~S}{~S}{~S}{cor}~%~%"
				coordx coordy radius_height radius_width
			)
		)	
	)
)

(defun fill_rectangles_grey_average ()
	(setq ratio_width (/ width_pagina width))
	(setq ratio_height (/ height_pagina height))

	(setq radius_width (/ ratio_width 1))
	(setq radius_height (/ ratio_height 1))

	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{gray}{~S};~%"
				(float (/ (+ red green blue) 765))
			)
			(format out
				"		\\fillRectangle{~S}{~S}{~S}{~S}{cor}~%~%"
				coordx coordy radius_height radius_width
			)
		)	
	)
)

(defun fill_rectangles_negative()
	(setq ratio_width (/ width_pagina width))
	(setq ratio_height (/ height_pagina height))

	(setq radius_width (/ ratio_width 1))
	(setq radius_height (/ ratio_height 1))

	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(setq red (- 255 (read image)))
			(setq green (- 255 (read image)))
			(setq blue (- 255 (read image)))

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\fillRectangle{~S}{~S}{~S}{~S}{cor}~%~%"
				coordx coordy radius_height radius_width
			)
		)	
	)
)

(defun node_characters ()
	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\node[font=\\tiny,scale=0.5,color=cor] at (~S,~S) {a};~%~%";
				coordx coordy
			)
		)	
	)
)

(defun draw_hearts ()
	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\node[font=\\tiny,scale=0.35,color=cor] at (~S,~S) {\\ensuremath\\heartsuit};~%~%";
				coordx coordy
			)
		)	
	)
)

(defun fill_hearts ()
	(loop for i from 1 to height do
		(loop for j from 1 to width do
			(set_color_image)

			(set_coordinates i j width height)

			(format out
				"		\\definecolor{cor}{RGB}{~S, ~S, ~S};~%"
				red green blue
			)
			(format out
				"		\\node[font=\\tiny,scale=0.5,color=cor] at (~S,~S) {\\ensuremath\\varheartsuit};~%~%";
				coordx coordy
			)
		)	
	)
)

(setq width_pagina 18)
(setq height_pagina 27)
(setq radius 0.015)

; open ppm file
(setq image (open "inovacao.ppm"))
; read first line with "P3" (magic numbers)
(setq garbage (read-line image))
; read second line with the comment "# CREATOR: GIMP PNM Filter Version 1.1"
(setq coment (read-line image))
; read and set the height e a width off image
(setq width (read image))
(setq height (read image))
; read the line with value color 255
(setq garbage (read-line image))
; set tex file that will receive the structure
(setq out (open "inovacao.tex" :direction :output))

(begin out)
; Select one of the options:
;(normal)
; (fill_circles)
; (draw_circles)
; (fill_ellipses)
; (draw_ellipses)
; (fill_squares)
; (draw_squares)
; (fill_rectangles)
(fill_rectangles_grey_average)
; (fill_rectangles_negative)
; (node_characters)
; (draw_hearts)
; (fill_hearts)
(end out)

(close out)
(close image)

; run "lualatex inovacao.tex" on terminal