library(shiny)

ui <- navbarPage(
	title = "Modulos",
	tabPanel(
		title = "Histograma",
		histograma_ui("histograma")
		),

	tabPanel(
		title = "Dispersao",
		dispersao_ui("dispersao")
		),

navbarMenu(
		title = "submenus",
	tabPanel(title = "sub1"),
	tabPanel(title = "sub2")
)#navbarMenu
)#navbarPage
server <- function(input, output, session) {

	histograma_server("histograma")

	dispersao_server("dispersao")

}
shinyApp(ui, server)
