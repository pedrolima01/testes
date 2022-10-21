# Modulo Dispersão -----

dispersao_ui <- function(id) {
	ns <- NS(id)
	tagList(
		fluidRow(
			column(
				width = 4,
				selectInput(
					ns("variavel"),
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
				x = mtcars[[input$variavel]],
				y = mtcars[[input$variavel_y]]
			)
		})
	})
}
