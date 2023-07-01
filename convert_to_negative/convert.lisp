; open ppm file
(setq in (open "inovacao.ppm"))

; read first line with "P3" (magic numbers)
(setq garbage (read-line in))

; read second line with the comment "# CREATOR: GIMP PNM Filter Version 1.1"
(setq coment (read-line in))

; read and set the height e a width off image
(setq width (read in))
(setq height (read in))

; read the line with value color 255
(setq garbage (read in))

(setq out (open "negativo.ppm" :direction :output))
(format out "P3~%#negativis de eye~%~S ~S~%255~%" width height)

(loop for i from 1 to height do
      (loop for j from 1 to width do
	    (setq red (read in))
	    (setq green (read in))
	    (setq blue (read in))
	    (format out "~S~%" (- 255 red))
	    (format out "~S~%" (- 255 green))
	    (format out "~S~%" (- 255 blue))
	    )
      )

(close out)
(close in)
