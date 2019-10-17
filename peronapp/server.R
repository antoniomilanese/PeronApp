library(shiny)
library(tidyverse)
library(tidytext)
library(readtext)
library(quanteda)



#df de perón. Para comparar. Lo cargo y lo estructuro.
#El corpus es pequeño y de prueba. Se puede mejorar mucho.

peron <- str_to_lower(readtext("peron.txt",encoding="UTF-8", text_field = "text" ))



#Server del peronistometro
shinyServer(function(input, output) {
  

  output$resultado <- renderValueBox({
    valueBox(
      formatC(as.data.frame(
        #Uso textat simil de quanteda para comparar la similitud de los textos. 
        textstat_simil(dfm_weight(
          #Hago una matriz con las palabras de ambos textos (el de peron y el que ingresé)
          dfm(corpus(c(peron = peron,imput = str_to_lower({ input$caption }))),
              #Remuevo stop words, puntos y comas (seguro hay una forma más eficiente de hacerlo) y le hago stemming a las palabras (me quedo con la raiz)
                                            remove = c(stopwords("es"),".", ",", ":", "//",";","//(",")",";"), stem=TRUE),
          #Uso dfm_weight para tratar de normalizar entre textos de diverso tamaño (no funciona muy bien)
                                        scheme= "prop", base = 1),margin="documents", 
          #Multiplico por 100 para que sea más lindo el resultado.
                             method="cosine"))$cosine*100, format="d")
      #esto no logré hacerlo funcionar
      ,paste('Peronismo')
      ,color = "yellow")})   
  #El resultado no es bueno, tengo que buscar una forma distinta de comparar para que me de textos más largos. 
  #Además estaría bueno hacerlo buscando fuentes de tweeter
  #Tengo que ver como usar pipes en shiny
})



