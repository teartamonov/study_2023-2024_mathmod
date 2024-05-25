---
## Front matter
title: "Лабораторная работа № 12"
subtitle: "Пример моделирования простого протокола передачи данных"
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
- Вычислить пространство состояний
- Сформировать отчёт о пространстве состояний и проанализировать его
- Построить граф пространства состояний

## Теоретическое введение

Рассмотрим ненадёжную сеть передачи данных, состоящую из источника, получателя.
Перед отправкой очередной порции данных источник должен получить от получателя подтверждение о доставке предыдущей порции данных.
Считаем, что пакет состоит из номера пакета и строковых данных. Передавать будем сообщение «Modelling and Analysis by Means of Coloured Petry Nets», разбитое по 8 символов.

# Выполнение лабораторной работы

Построили модель. (рис. [-@fig:001])

![Модель в cpntools](image/1.PNG){#fig:001 width=70%}

Запустили её и посмотрели промежуточный результат работы. (рис. [-@fig:002])

![Первая часть сообщения уже доставлена, вторая в пути](image/2.PNG){#fig:002 width=70%}

Результат работы модели. (рис. [-@fig:003])

![Сообщение доставлено](image/3.PNG){#fig:003 width=70%}

Сформировали отчёт о пространстве состояний 1/2. (рис. [-@fig:004])

![Процесс достиг лимита в 5 минут, поэтому не сгенерировал всю информацию](image/4.PNG){#fig:004 width=70%}

Сформировали отчёт о пространстве состояний 2/2. (рис. [-@fig:005])

![Отчёт о пространстве состояний](image/5.PNG){#fig:005 width=70%}

Построили частичный граф пространства состояний. (рис. [-@fig:006])

![Граф пространства состояний, видно, что на 156 шаге была доставлена только первая часть сообщения](image/6.PNG){#fig:006 width=70%}

# Выводы

- Реализовали модель в cpntools
- Вычислили пространство состояний
- Сформировали отчёт о пространстве состояний и проанализировали его
- Построили граф пространства состояний
