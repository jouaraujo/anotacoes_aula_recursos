library(ggplot2)
library(patchwork)
library(skimr)
library(tidymodels)
library(tidyverse)


data("diamonds")



set.seed(1)


diamonds_completo<- diamonds |> 
  initial_split( ) 

diamonds_treino <- training(diamonds_completo) |> 
                   view()
diamonds_teste <- testing(diamonds_completo)|> 
  view()


diamonds_model <- decision_tree(
  cost_complexity = tune(),
  min_n = 2, 
  tree_depth = 10
) |> 
  set_engine("rpart") |> 
  set_mode("regression")


set.seed(1)
diamonds_validacao_treino <- validation_split(diamonds_treino, 
                                       prop = .75)

set.seed(1)
diamonds_tunagem <- tune_grid(
  diamonds_model,
  price ~ x,
  resamples = diamonds_validacao_treino,
  grid = 10,
  metrics = metric_set(rmse, rsq),
  control = control_grid(verbose = TRUE, allow_par = FALSE)
)

autoplot(diamonds_tunagem)

collect_metrics(diamonds_tunagem) |> View()
show_best(diamonds_tunagem, "rmse")|> View()


diamonds_melhor_hiperparams <- select_best(diamonds_tunagem, "rmse")

diamonds_modelo_hiper <- diamonds_model |> 
  finalize_model(diamonds_melhor_hiperparams)


# Agora, definidos os hiperparâmetros começa a modelagem ------------------


# Definição do modelo -----------------------------------------------------

hipotese <- decision_tree(
  cost_complexity = 4.25834416672009e-05,
  min_n = 2, 
  tree_depth = 10
) |> 
  set_engine("rpart") |> 
  set_mode("regression")
# Ajuste do modelo - usando base de treino --------------------------------



modelo <- hipotese |>  
  fit(price ~ x, data = diamonds_treino)

print(modelo)
rpart.plot::prp(modelo$fit)

  
