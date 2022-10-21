library(shiny)
library(ggplot2)

imdb <- readr::read_rds(file = here::here("dados/imdb.rds"))

opcoes <- imdb %>%
	pull(generos) %>%
	paste(collapse = "|") %>%
	stringr::str_split("\\|", simplify = TRUE) %>%
	as.character() %>%
	unique() %>%
	sort()



ui <- fluidPage(title = "IMDB",
	sidebarLayout(
		sidebarPanel(
			h1("IMDB"),
			selectInput("genero",
									label = "Selecione um genero",
									choices = opcoes)
		),
		mainPanel(
			plotOutput("grafico1"),
			plotOutput("grafico2")
		)
	)
)

server <- function(input, output, session) {

	imdb_filtrada <- reactive({
		imdb %>%
			dplyr::filter(stringr::str_detect(generos, input$genero))
	})



	output$grafico1 <- renderPlot({
		imdb_filtrada() %>%
			ggplot(aes(x = ano)) +
			geom_bar()
	})

	output$grafico2 <- renderPlot({
		imdb_filtrada() %>%
			dplyr::group_by(ano) %>%
			dplyr::summarise(receita_media = mean(receita, na.rm = TRUE)) %>%
			ggplot(aes(x = ano, y = receita_media)) +
			geom_col()
	})


}

shinyApp(ui, server)
