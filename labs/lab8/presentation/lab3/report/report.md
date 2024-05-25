---
## Front matter
title: "Лабораторная работа № 11"
subtitle: "Модель системы массового обслуживания M|M|1"
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

## Теоретическое введение

В систему поступает поток заявок двух типов, распределённый по пуассоновскому закону. Заявки поступают в очередь сервера на обработку. 
Дисциплина очереди - FIFO. Если сервер находится в режиме ожидания (нет заявок на сервере), то заявка поступает на обработку сервером.

# Выполнение лабораторной работы

Построили модель на трёх страницах. (рис. [-@fig:001])

![Главная страница System](image/1.PNG){#fig:001 width=70%}

Построили модель на трёх страницах. (рис. [-@fig:002])

![Страница Arrivals - генератор заявок](image/2.PNG){#fig:002 width=70%}

Построили модель на трёх страницах. (рис. [-@fig:003])

![Страница Server - сервер обработки заявок](image/3.PNG){#fig:003 width=70%}

Запустили модель. (рис. [-@fig:004])

![Результат работы модели](image/4.PNG){#fig:004 width=70%}

Построили график изменения задержки очереди. (рис. [-@fig:005])

![График изменения задержки очереди](image/5.PNG){#fig:005 width=70%}

Построили график с периодами времени, когда задержка превышала лимит. (рис. [-@fig:006])

![Периоды времени, когда значения задержки в очереди превышали заданное значение в 200 единиц](image/6.PNG){#fig:006 width=70%}

# Выводы

- Реализовали модель в cpntools
