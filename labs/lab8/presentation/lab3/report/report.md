---
## Front matter
title: "Упражнение"
subtitle: "Задание для самостоятельного выполнения"
author: "Артамонов Тимофей Евгеньевич"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Введение

## Теоретическое введение

Фигуры Лиссажу — траектории, прочерчиваемые точкой, совершающей одновременно два гармонических колебания в двух взаимно перпендикулярных направлениях. Впервые изучены французским учёным Жюлем Антуаном Лиссажу. 

## Задание

Построить с помощью xcos фигуры Лиссажу с различными значениями параметров.
   
# Выполнение лабораторной работы

Построили модель в xcos и запустили с начальными параметрами. (рис. [-@fig:001])

![A = B = 1, a = b = 2, фаза d = 0](image/1.PNG){#fig:001 width=70%}

Дальше поэкспериментировали с параметрами. (рис. [-@fig:002])

![A = B = 1, a = b = 2, фаза d = pi/2](image/2.PNG){#fig:002 width=70%}

Другие параметры. (рис. [-@fig:003])

![A = B = 1, a = b = 2, фаза d = pi/4](image/3.PNG){#fig:003 width=70%}

Другие параметры. (рис. [-@fig:004])

![A = B = 1, a = 2, b = 3, фаза d = 0](image/4.PNG){#fig:004 width=70%}

Другие параметры.  (рис. [-@fig:005])

![A = B = 1, a = 2, b = 3, фаза d = pi/3](image/5.PNG){#fig:005 width=70%}

Другие параметры. (рис. [-@fig:006])

![A = B = 1, a = 2, b = 3, фаза d = pi/4](image/6.PNG){#fig:006 width=70%}

Другие параметры. (рис. [-@fig:007])

![A = B = 1, a = 2, b = 4, фаза d = pi/2](image/7.PNG){#fig:007 width=70%}

Другие параметры. (рис. [-@fig:008])

![A = B = 1, a = 2, b = 6, фаза d = 2pi/3](image/8.PNG){#fig:008 width=70%}

Другие параметры. (рис. [-@fig:009])

![A = B = 1, a = 2, b = 6, фаза d = pi/2](image/9.PNG){#fig:009 width=70%}

Другие параметры. (рис. [-@fig:010])

![A = B = 1, a = 2, b = 6, фаза d = 0](image/10.PNG){#fig:010 width=70%}

Другие параметры. (рис. [-@fig:011])

![A = B = 1, a = 2, b = 4, фаза d = pi/3](image/11.PNG){#fig:011 width=70%}


# Выводы

- Для приведённой схемы разработали имитационную модель в пакете NS-2.
- Построили график изменения размера окна TCP (в Xgraph и в GNUPlot).
- Построили график изменения длины очереди и средней длины очереди на первом маршрутизаторе.
