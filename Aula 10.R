library(tidyverse)

tidyverse::tidyverse_packages()
dplyr::filter()
dplyr::select()
tibble::view()
tibble::as_tibble()

"%>%" <- magrittr::`%>%`
"+" <- magrittr::`%>%`

dplyr::select()
dplyr::filter()
dplyr::mutate()
dplyr::group_by()
dplyr::summarise()
tidyr::
tibble::      
readr::

mtcars <- mtcars |> 
         as_tibble() |> 
         view()

# 1) Selecionar colunas
# dplyr::select()

# mtcars |> 
#   dplyr::select(mpg) |> 
#   tibble::view()


mtcars |> 
   select(mpg) |> 
   view()

# 2) filtrando linhas COM BASE EM CRITÉRIOS
# IMPOSTOS NAS COLUNAS
# dplyr::filter() 

mtcars |> 
  filter(mpg > 25) |> 
  view()


# Assim com pipe
mtcars |> 
  select(mpg, cyl, disp, wt) |> 
  filter(mpg > 25) |> 
  view()


# OU assim sem pipe

view(filter(select(mtcars,mpg, cyl, disp, wt), mpg>25))


mtcars |> 
  select(mpg, cyl, disp, wt) |> 
  filter(mpg > 25,  wt >1.8) |> 
  view()

mtcars |> 
  select(mpg, cyl, disp, wt) |> 
  filter(mpg > 25 | wt > 1.8) |> 
  view()

# 3) Criar e/ou transformar variáveis
# dplyr::mutate() 

mtcars |> 
  mutate( mpg=log(mpg) )|> 
  view()

mtcars |> 
  mutate( mpg_com_log=log(mpg) )|> 
  view()

mtcars |> 
  select(mpg, cyl, disp, wt) |> 
  filter(mpg > 25,  wt >1.8) |> 
  mutate( mpg_com_log=log(mpg) )|>
  view()

mtcars |> 
  select(mpg, cyl, disp, wt) |> 
  filter(mpg > 25,  wt >1.8) |> 
  mutate( mpg_com_log=log(mpg) )|>
  select(mpg, mpg_com_log, cyl, disp, wt) |> 
  view()

mtcars |> 
  select(mpg, cyl, disp, wt) |> 
  filter(mpg > 25,  wt >1.8) |> 
  mutate( mpg_com_log=log(mpg) )|>
  select(mpg, mpg_com_log, cyl:wt) |> 
  view()

mtcars |> 
  select(mpg, cyl, disp, wt) |> 
  filter(mpg > 25,  wt >1.8) |> 
  mutate( mpg_com_log=log(mpg) )|>
  select(mpg, mpg_com_log, everything()) |> 
  view()

# 4) Criar sumários na base de dados
# dplyr::summarize

dplyr::summarize()
dplyr::summarise()

mtcars |> 
  summarise(média=mean(mpg)) 


mtcars |> 
  summarise(média_mpg=mean(mpg),
            var_mpg=var(mpg),
            desv_p=sd(mpg),
            média_wt=mean(wt)) |> 
            view()


mtcars |> 
  summarise(média_mpg=mean(mpg),
            var_mpg=var(mpg),
            desv_pad_mpg=sd(mpg)) |> 
  view()


# 5) Criar sumários com agrupamento
# dplyr::group_by + dplyr::summarize

mtcars |> 
  group_by(cyl) |> 
  summarise(média_mpg=mean(mpg),
            var_mpg=var(mpg),
            desv_pad_mpg=sd(mpg)) |> 
  view()
