
#' Calculo
#'
#' Pacote para calculos matemáticos
#'
#' @param x primeira variavel
#' @param y segunda variavel
#' @param op operação matemática
#'
#' @return Um valor numérico
#' @export
#'
#' @examples
#'
#'
calculo <- function(x, y, op) {
	if (op == "soma")
		zz <- soma(x, y)
	if (op == "subt")
		zz <- subt(x, y)
	if (op == "mult")
		zz <- mult(x, y)
	if (op == "divi")
		zz <- divi(x, y)

	return(zz)
}

