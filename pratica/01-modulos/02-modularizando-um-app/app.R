library(shiny)


# Modulo Histograma -------
histograma_ui <- function(id) {
	ns <- NS(id)
	tagList(
		selectInput(
			ns("variavel"),
			label = "Selecione uma variável",
			choices = names(mtcars)
		),
		br(),
		plotOutput(ns("grafico"))

	)
}

histograma_server <- function(id) {
	moduleServer(id, function(input, output, session) {
		output$grafico <- renderPlot({
			hist(mtcars[[input$variavel]])
		})
	})
}


# Modulo Dispersão -----

dispersao_ui <- function(id) {
	ns <- NS(id)
	tagList(
		fluidRow(
			column(
				width = 4,
				selectInput(
					ns("variavel_x"),
					label = "Selecione a variável x",
					choices = names(mtcars)
				)

			),
			column(
				width = 4,
				selectInput(
					ns("variavel_y"),
					label = "Selecione a variável y",
					choices = names(mtcars)
				)
			),
			br(),
			plotOutput(ns("grafico_2"))
		)
	)
}

dispersao_server <- function(id) {
	moduleServer(id, function(input, output, session) {
		output$grafico_2 <- renderPlot({
			plot(
				x = mtcars[[input$variavel_x]],
				y = mtcars[[input$variavel_y]]
			)
		})
	})
}





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
		title = "dispersao",
	tabPanel(title = "sub1"),
	tabPanel(title = "sub2")
)#navbarMenu
)#navbarPage
server <- function(input, output, session) {

	histograma_server("histograma")

	dispersao_server("dispersao")

}
shinyApp(ui, server)
