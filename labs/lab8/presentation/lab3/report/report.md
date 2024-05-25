---
## Front matter
title: "Лабораторная работа № 9"
subtitle: "Задача об обедающих мудрецах"
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

- Реализовать модель в cpntools
- Вычислить пространство состояний, построить граф состояний, сформировать отчёт

## Теоретическое введение

Задача об обедающих мудрецах — классическая задача о блокировках и синхронизации процессов.
Пять мудрецов сидят за круглым столом и могут пребывать в двух состояниях — думать и есть. Между соседями лежит одна палочка для еды. 
Для приёма пищи необходимы две палочки. Палочки — пересекающийся ресурс. Необходимо синхронизировать процесс еды так, чтобы мудрецы не умерли с голода.

# Выполнение лабораторной работы

Построили модель. (рис. [-@fig:001])

![5 философов думают, 5 палочек на столе](image/1.PNG){#fig:001 width=70%}

Запустили модель. (рис. [-@fig:002])

![Максимум 2 философа могу есть одновременно](image/2.PNG){#fig:002 width=70%}

Вычислили пространство состояний и сформировали отчёт от пространстве состояний. (рис. [-@fig:003])

![Отчёт от пространстве состояний](image/3.PNG){#fig:003 width=70%}

Построили граф пространства состояний. (рис. [-@fig:004])

![Граф пространства состояний](image/5.PNG){#fig:004 width=70%}

# Выводы

- Реализовали модель в cpntools
- Вычислили пространство состояний, построили граф состояний, сформировали отчёт
