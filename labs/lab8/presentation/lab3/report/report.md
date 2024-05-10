---
## Front matter
title: "Лабораторная работа № 7"
subtitle: "Модель M | M | 1 | inf"
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

## Цель работы

- Реализация модели в xcos
  
# Выполнение лабораторной работы

Начальные данные: $\lambda = 0.3$, $\mu = 0.35$, $z_0 = 6$

Реализовали первый суперблок. (рис. [-@fig:001])

![Суперблок, моделирующий поступление заявок](image/10.PNG){#fig:001 width=70%}

Реализовали второй суперблок. (рис. [-@fig:002])

![ Суперблок, моделирующий обработку заявок](image/11.PNG){#fig:002 width=70%}

Создали общую схему моедли M|M|1|inf. (рис. [-@fig:003])

![Фазовый портрет модели](image/12.PNG){#fig:003 width=70%}

Запустили модель. (рис. [-@fig:004])

![Обработка заявок(слева)(синий - поступление, черный обработка), динамика размера очереди(справа)](image/2.PNG){#fig:004 width=70%}

# Выводы

- Реализовали модели в xcos
